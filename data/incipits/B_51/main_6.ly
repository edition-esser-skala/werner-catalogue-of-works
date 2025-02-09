\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d'2.^\partSs c4
  c8[ b] b b a[ c] b a
  b16[ c] d4 es8 f4 f
}

text = \lyricmode {
  A -- gnus
  De -- i, qui tol -- lis pec --
  ca -- ta, pec -- ca -- ta,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
