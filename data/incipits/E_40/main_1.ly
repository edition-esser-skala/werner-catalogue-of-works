\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  r4^\partSs r8 f b f d' es
  f d16[ c] b8 d16[ es] f8 c16[ a] f8 d'
  c16[ a] f8
}

text = \lyricmode {
  Auf, auf, ihr Hir -- ten
  all -- zu -- gleich, bringt Flö -- ten und Schall --
  mey -- en
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
