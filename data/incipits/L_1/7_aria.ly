\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Tempo giusto"
    \partial 8 c'8 a16( c) a( c) a( c) a( c)
    d( f) d( f) d( f) d( f) \gotoBar "12"
    f,4 r
    r r8 c'\p
    a16( c a c) a( c a c)
    d( f d f) d( f d f)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Tempo giusto"
    \partial 8 a'8 f16( a) f( a) f( a) f( a)
    b( d) b( d) b( d) b( d) \gotoBar "12"
    f,4 r
    r r8 a\p
    f16( a f a) f( a f a)
    b( d b d) b( d b d)
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \twofourtime \key f \major \time 2/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    \partial 8 r8 R2*2 \gotoBar "12"
    r8 r16 f,\f a8. c16
    f8 e16[ d] c[ b] a[ g]
    f4 r8 c'
    d b f' b,
  }
}

SoliLyrics = \lyricmode {
  Al -- lo frisch
  auf bräf gwürf -- felt
  drauf I
  zahl ja röd -- li
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Tempo giusto"
    \partial 8 r8 f4 r
    f r \gotoBar "12"
    f,8 f'~ f16 c a c
    f, f' e d c b a g
    f4 r
    f r
  }
}

BassFigures = \figuremode {
  r8 r2
  <6 4>
  r
  r
  r
  <6 4>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "Hollähippen-" "Krämer" }
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
