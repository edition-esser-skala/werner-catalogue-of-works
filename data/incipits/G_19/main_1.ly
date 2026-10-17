\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  c'4.^\partSc c8 d4 f e d
  c b8[ c] a2 r
  r r4 f a h
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  _ _ son,
  Chri -- ste, __ _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
