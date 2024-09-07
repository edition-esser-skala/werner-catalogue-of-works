\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  c'4^\partSc f2 e4~
  e d2 c4
  c2 \clef bass f,,4^\partBs g
  a a8 a a4 a
  b a a g
}

text = \lyricmode {
  A -- _ _
  _ _
  leph. E -- go
  vir vi -- dens pau -- per --
  ta -- tem "me -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
