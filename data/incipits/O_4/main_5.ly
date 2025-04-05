\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "Prestissimo"
  \grace { d'16^\partVi cis } d4 \grace { a16 g } a4 \grace { fis16 e } fis4 d
  \grace { d'16 cis } d4 \grace { h16 a } h4 \grace { g16 fis } g4 d
  \grace { e'16 d } e4 \grace { cis16 h } cis4 \grace { a16 g } a4 a,8 g'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
