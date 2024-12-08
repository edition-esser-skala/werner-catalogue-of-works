\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \dorian \time 4/4 \tempoMarkup "Allegro"
  d'4.^\partVi d16 e f8 f r4
  e4. e16 f g8 g r4
  f4. f16 g a8 a r a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
