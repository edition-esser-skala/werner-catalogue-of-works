\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \twofourtime \key e \major \time 2/4 \tempoMarkup "[no tempo]" \autoBeamOff
  e4^\partAc fis8 \clef soprano h^\partSc
  cis dis e cis
  dis e4 dis8
  e r r4
}

text = \lyricmode {
  For -- tem For --
  tem vi -- ri -- li
  pe -- _ cto --
  re
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
