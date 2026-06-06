\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  r8^\partSc d'4 d8 e d16[ c] h8[ c]
  d h d[ c16 h] a8[ h] c4
  h16[ c] d4 c16[ h] a8 d4 c16[ d]
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- _ _
  son, __ _ e -- lei -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
