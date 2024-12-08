\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 6/8 \tempoMarkup "Allegro"
  a''8.^\partVi h16 a8 gis a,4
  f'8. g16 f8 e a,4
  d8. e16 d8 c d16 c h a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
