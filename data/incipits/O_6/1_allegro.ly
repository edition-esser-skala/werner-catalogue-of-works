\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g'16 g h h d d g g
    h4 d
    r8 c d, c'
    h16 h g g d d h8
    r c\p d, c'
    h16 h g g d d h8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g'16 g h h d d g g
    h4 d
    r8 c d, c'
    h16 h g g d d h8
    r c\p d, c'
    h16 h g g d d h8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
    g4 r
    g'16 g d d h h g g
    d'8 a' fis d
    g4 r
    d8\p a' fis d
    g4 r
  }
}

BassFigures = \figuremode {
  r2
  r
  r8 <_!> <6> <7 3>
  r2
  r4 <6>8 <7 3>
  r2
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
