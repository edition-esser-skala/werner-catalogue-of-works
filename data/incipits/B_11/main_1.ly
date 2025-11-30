\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  c'4^\partSc d c r8 b
  a[ f' e d] c[ b] a4~
  a h c r
}

text = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _
  _ son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
