\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  c'4^\partSs r r8 a16 cis e \hA cis a g'
  f4 r r8 g, c e
  g g, b c a a r a
}

text = \lyricmode {
  Seht! Wie der ſtol -- zen Schlan -- gen
  Haubt, die durch die
  lan -- ge Erb -- ſünds -- ket -- ten den
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
