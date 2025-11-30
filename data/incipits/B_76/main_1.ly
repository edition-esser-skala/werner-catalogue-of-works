\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \tempoMarkup "Vivace"
  g'8^\partOrg h fis d g4 r
  r8 c h a g4 r
  r8 c h a g4. fis8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
