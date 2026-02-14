\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
  c'2.^\partSc a4 f' d
  h c r c2 h8[ a]
  h[ c] d4 e2. d8[ c]
}

text = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- _
  lei -- _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
