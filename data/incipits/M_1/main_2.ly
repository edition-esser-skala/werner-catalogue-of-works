\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Allegro"
  g'4.^\partVii a8 b8. b16 c8 d
  es fis, g a \fC d4.^\partVi e8
  f8. f16 g8 a b cis, d e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
