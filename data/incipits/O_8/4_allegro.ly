\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f4. g8
    a b c d
    e, f g a
    b c d e
    a,4. b8
    c d16 c b8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    R2
    c'4. b16 a
    g8 a b c
    b4. a16 g
    f4. g8
    a b16 a g8 f
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    r4 f~
    f8 g a b
    c4 g~
    g8 a b c
    d, d' c b
    a g a b
  }
}

BassFigures = \figuremode {
  r2
  r
  <5 3>8 <6 4> <3 8>4
  r2
  <5 3>4 <\t \t>8 <6>
  q4. <8 6>16 <7 5>
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
