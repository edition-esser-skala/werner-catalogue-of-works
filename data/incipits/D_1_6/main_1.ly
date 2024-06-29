\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  r4^\partSc e'2 e4
  g2 d
  c2. c4
  h h2 h4
}

text = \lyricmode {
  Do -- mum
  tu -- am,
  Do -- mi --
  ne, de -- cet,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
