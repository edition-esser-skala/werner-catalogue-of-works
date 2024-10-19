\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
  f'4^\partVi f~
  f16 e f8~ f e
  f16 e f8~ f e
  f f, r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
