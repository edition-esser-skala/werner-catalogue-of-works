\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \tempoMarkup "Poco allegro" \autoBeamOff
  g4.^\partTc g8 d'4 b8 g
  es' es d c \clef alto d4.^\partAc d8
  g4 f8 d b' b a g
}

text = \lyricmode {
  In -- tro -- i -- bo in
  do -- mum, do -- mum In -- tro --
  i -- bo in do -- mum, do -- mum
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
