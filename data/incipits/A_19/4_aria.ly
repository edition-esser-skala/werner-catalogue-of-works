\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Spirituoso"
    f8\trill a\trill c\trill c,\trill
    f16( g32 a b c d e) f8 a \gotoBar "14"
    c,8\trill g\trill e\trill c\trill
    R2
    r32 a'\p b! c d e f g a8 r
    R2
    r32 a\f g f e d c b a8 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Spirituoso"
    f8\trill a\trill c\trill c,\trill
    f16( g32 a b c d e) f8 a \gotoBar "14"
    c,8\trill g\trill e\trill c\trill
    R2
    r32 f\p g a b! c d e f8 r
    R2
    r32 f\f e d c b a g f8 r
  }
}

Soli = {
  \relative c' {
    \clef alto
    \twofourtime \key f \major \time 2/4 \autoBeamOff \tempoMarkup "Spirituoso"
    R2*2 \gotoBar "14"
    r4 r8 c
    f a \tuplet 3/2 8 { c16[ d c] b[ a g] }
    f8.\trill f16 f8 a
    d,16[ d'] c[ b] \tuplet 3/2 8 { a[ b c] b[ a g]
    a[ g f] } f8 r a
  }
}

SoliLyrics = \lyricmode {
  Es
  muß nicht ſtäts ein
  Don -- ner -- ſtein den
  ſtol -- zen Ke -- der
  ſchmet -- tern, und
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Spirituoso"
    f4 e
    d a \gotoBar "14"
    c4 r8 c'
    a f e c
    d d' a f
    b,4 c
    f, f'
  }
}

BassFigures = \figuremode {
  r2
  r4 <6>
  r2
  r
  r
  <5>8 <6> <6 4> <5 3>
  r2
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
        \set Staff.instrumentName = "Debora"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
