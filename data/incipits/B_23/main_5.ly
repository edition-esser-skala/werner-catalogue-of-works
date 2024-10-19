\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Andante"
  c1~^\partBc
  c2 h
  cis d~
  d c
  h
}

text = \lyricmode {
  A --
  gnus
  De -- _
  _
  i,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
