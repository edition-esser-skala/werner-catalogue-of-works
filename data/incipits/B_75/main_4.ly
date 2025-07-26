\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/4 \tempoMarkup "Allegro"
  c'4.^\partOrg h8 c4
  g c8 g e c
  g'2 r4
  c, e4. d16 c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
