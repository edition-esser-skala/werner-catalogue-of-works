\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto"
    f'2 g16 a b4 d,8
    e2 f16( g) a4 c,8
    d b4 d8 c a4 c8
    b g4 b8 a f d' c
    f e a g16 f e8 g a e
    f d, r c' d f g d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Presto"
    R1*4
    r2 c'
    d16 e f4 a,8 h2
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Presto"
    R1*6
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Presto"
    R1*6
  }
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
  >>
}
