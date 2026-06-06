\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \tempoMarkup "Alla capella · Vivace" \autoBeamOff
  d'1^\partSc e2
  cis d2. c4
  h2 c2. d4
  c h a1
  g2 r r
}

text = \lyricmode {
  Ky -- ri --
  e e -- _
  lei -- _ _
  _ _ _
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
