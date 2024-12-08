\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/8 \tempoMarkup "Allegro assai"
  f'4.^\partVi
  \grace { e16[ d] } c4.
  \grace { b16[ c] } d4.
  \grace { c16[ b] } a4.
  \grace { g'16[ a] } b4.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
