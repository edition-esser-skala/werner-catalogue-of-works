\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "[no tempo]"
  d'8^\partUnk g16 a h c d8 fis,4 r8 g
  a c h a16 g fis4 r8 g,
  a c h a16 g fis4 r8 h'
  a cis, d4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
