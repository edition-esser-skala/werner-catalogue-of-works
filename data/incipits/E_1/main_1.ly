\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c'1^\partSc a2 a
  h h c1
  c2 e d1
  c h2 c
}

text = \lyricmode {
  A -- ve Ma --
  ri -- a kla --
  re, du hel --
  ler Mor \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
