\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Vivace"
    r8 c'c c es d16 c h8 c
    fis( g) r c,\p es d16 c h8 c
    fis( g) r e\f f d es c
    des c16 h c8 f es d16 c d4\trill
    c8 es d16 b c a b8 d g f16 es
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 4/4 \tempoMarkup "Vivace"
    R1*4
    r2 r8 g' g g
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 4/4 \tempoMarkup "Vivace"
    R1*5
  }
}

BassFigures = \figuremode {
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
}
