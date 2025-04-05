\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    f'2\fE g16 a b4 d,8
    e2 f16 g a4 c,8
    d b4 d8 c a4 c8
    b g4 b8 a f d' c
    f e a g16 f e8 g a e
    f d, r c' d f g d
    e c, r h' c d a' c,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    R1*4
    r2 c'\f
    d16 e f4 a,8 h2
    c16 d e4 g,8 a f4 a8
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    R1*7
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    R1*7
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
