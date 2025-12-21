\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key g \major \time 2/2 \tempoMarkup "Presto"
  r8^\partVi h' a g fis g a4
  r8 c h a g a h4
  r8 d g h e, c' c16 h a8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
