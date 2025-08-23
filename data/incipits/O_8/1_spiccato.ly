\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 2 2/8 \tempoMarkup "Spiccato"
    f16 a c8-!
    f-! c'-!
    a-! f-!
    c-! a-!
    f16\p a c8-!
    f-! c'-!
    a-! f-!
    c-! a-!
    f32\f a' a a a a a a
    h8-! c-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 2 2/8 \tempoMarkup "Spiccato"
    f16 a c8-!
    f-! c'-!
    a-! f-!
    c-! a-!
    f16\p a c8-!
    f-! c'-!
    a-! f-!
    c-! a-!
    f32\f a' a a a a a a
    h8-! c-!
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \major \time 2 2/8 \tempoMarkup "Spiccato"
    f8-! r
    f16 c a8-!
    f-! f'-!
    c-! a-!
    f\p r
    f'16 c a8-!
    f-! f'-!
    c-! a-!
    f\f f'~
    f-! e-!
  }
}

BassFigures = \figuremode {
  r4
  r
  r
  r
  r
  r
  r
  r
  r
  <4!>8 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
