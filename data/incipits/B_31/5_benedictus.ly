\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Larghetto"
    r8 fis'\f h( d) cis( e,)
    d fis h( d,) cis( h)
    ais fis' dis( c') h( a) \gotoBar "9"
    h,4 r r
    r8 fis'4\p d h8
    r e16( d) d( cis) cis( h) h( a!) a( g)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Larghetto"
    r8 fis'\f h( d) cis( e,)
    d fis h( d,) cis( h)
    ais fis' dis( c') h( a) \gotoBar "9"
    h,4 r r
    r8 fis'4\p d h8
    r e16( d) d( cis) cis( h) h( a!) a( g)
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key h \minor \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
    R2.*3 \gotoBar "9"
    h'4.^\solo d16[ cis] h8 ais
    h4 h, r8 d'
    a!4. e8 e g
  }
}

AltoLyrics = \lyricmode {
  Be -- _ _ ne --
  di -- ctus, qui
  ve -- _ nit in
}

Organo = {
  \relative c {
    \clef bass
    \key h \minor \time 3/4 \tempoMarkup "Larghetto"
    h'2-\solo ais4
    h g eis
    fis h dis, \gotoBar "9"
    h d'16 cis h8 fis d fis
    h,4 h' h,
    cis a! cis
  }
}

BassFigures = \figuremode {
  r2.
  r2 <6>4
  <_+> q <6>
  r2 <6>8 <_+>
  r2. %10
  r2.
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
