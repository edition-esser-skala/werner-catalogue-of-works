\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  r2 c^\partTc
  h g
  a h
  g4 e' d c
}

text = \lyricmode {
  Pa --
  trem o --
  mni -- po --
  ten -- _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
