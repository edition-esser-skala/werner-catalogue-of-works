\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 6/8 \tempoMarkup "Allegro assai"
  \partial 8 b'8^\partVi b4\trill f'8 d b f
  b4\trill f'8 d b f
  b f b d b d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
