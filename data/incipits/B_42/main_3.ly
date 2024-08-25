\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  e'2^\partSc c e
  d g1
  e2 e r
  c c4 d d d
}

text = \lyricmode {
  Cre -- do in
  u -- num
  De -- um,
  Pa -- trem o -- mni -- "po -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
