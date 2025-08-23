\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    c''2 a8( f)
    c4 b' a8( f)
    c2\p a8( f)
    c4 b' a8( f)
    g4\f c \tuplet 3/2 4 { d8 e f }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    c''2 a8( f)
    c4 b' a8( f)
    c2\p a8( f)
    c4 b' a8( f)
    g4\f c \tuplet 3/2 4 { d8 e f }
  }
}
BassoContinuo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f4 a f
    e c f
    r e\p f
    e c f~
    f\f e d
  }
}

BassFigures = \figuremode {
  r4 <6>2
  q4 <7>2
  r4 <6>2
  q4 <7>2
  <2>4 <6> <6!>
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
