\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "[no tempo]"
  a'4.^\partVi h16 cis d4
  h \grace a8 g2
  fis4 a2
  g fis4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
