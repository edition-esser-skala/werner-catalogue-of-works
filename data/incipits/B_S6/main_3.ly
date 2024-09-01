\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
  r4^\partSc c' c
  h h8 h h h
  c2 c4
}

text = \lyricmode {
  Cre -- do,
  cre -- do in u -- num
  De -- um,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
