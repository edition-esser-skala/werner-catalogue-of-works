\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
  d'4^\partSc e d8 g, c4
  h8 d4 c16[ h] a8 d4 cis8
  d h4 a8 h4 r
}

text = \lyricmode {
  Hic est pa -- nis vi --
  vus, pa -- nis vi -- _ _
  vus, pa -- _ nis,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
