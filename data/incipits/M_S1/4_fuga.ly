\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    R1*4
    g''4. g16 g g8 g g g
    g fis16 e d c h a g8 g'4 e8~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Presto"
    c'4. c16 c c8 c c c
    c h16 a g f e d c8 c'4 a8~
    a d4 h e e8
    d c4 h8 c e d16 e c d
    h8 g16 a h8 c h g16 a h8 c
    d16 e d c h a g fis g4 r8 c16 d
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Presto"
    R1*6
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Presto"
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
