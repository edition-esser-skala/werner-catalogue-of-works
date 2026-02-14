\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  r4^\partSs e'2 d4
  c2 h8 c d[ c16 h]
  a4 r r c
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  nit, "be -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
