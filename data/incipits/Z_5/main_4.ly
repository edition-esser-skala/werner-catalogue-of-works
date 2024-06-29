\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
  g'2^\partSc c4
  \grace h8 a4 g r
  a f' \grace e8 d4
  \grace c8 h8.[ c32 d] c4 r
}

text = \lyricmode {
  Hic est
  pa -- nis,
  pa -- _ nis
  vi -- vus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
