\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
  d'2.^\partSc d4 h d
  g,2. a8[ h] c4 d
  e d8[ c] h4 d2 cis4
  d
}

text = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ _
  _ _ _ _ _
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
