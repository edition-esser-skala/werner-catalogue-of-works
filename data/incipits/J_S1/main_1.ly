\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
  r4^\partSc r e'
  d2 d4
  e d2
  c e4
  d4. d8 d4
}

text = \lyricmode {
  Te
  De -- um
  lau -- da --
  mus, te
  Do -- mi -- num,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
