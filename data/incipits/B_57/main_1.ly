\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/2 \tempoMarkup "[Alla capella]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  d1^\partBc e
  f2. e4 d2 g4 f
  e2 a4 g f e f2
  e1 \clef soprano a'^\partSs
  h c2. \hA h4
}

text = \lyricmode {
  Ky -- ri --
  e __ _ _ e -- _
  _ _ _ _ _ _
  lei -- Ky --
  ri -- e __ _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
