\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/4 \tempoMarkup "Allegro"
    \once \override Staff.TimeSignature.style = #'single-digit
  c4.^\partOrg c8 c' c,
  g4. g8 g' g,
  c4. c8 e e
  f4. d8 fis fis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
