\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "Allegro assai"
  e'4^\partVi e, r
  f' f, r
  gis' gis, r
  a' a, r
  g'! g, r
  f' f, r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
