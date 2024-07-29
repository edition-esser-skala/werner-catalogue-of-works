\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \minor \time 3/2 \tempoMarkup "[no tempo]"
  g'1^\partOrg a2
  b fis d
  g e a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
