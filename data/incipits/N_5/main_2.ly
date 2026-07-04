\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \dorian \time 3/2 \tempoMarkup "Larg[hett]o"
  a'4^\partVi d f2 \tuplet 3/2 { e4 f g }
  g2 f e4 f
  g2 f es
  d cis4 e a,2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
