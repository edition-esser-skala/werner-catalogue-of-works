\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 2/4 \tempoMarkup "Allegro"
  f4~\trill f8.^\partVi f'16
  f,4~\trill f8. f'16
  f,8.\trill f'16 f,8.\trill f'16 %110
  f,4~ f8. f'16
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
