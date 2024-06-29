\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \lydian \time 3/2 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
  c2.^\partTc a4 d2
  h4 g \clef soprano c'2.^\partSc a4
  d2 h4 g c2
  a g2. g4
  g2 r r
}

text = \lyricmode {
  Ky -- ri -- e
  "e -" _ Ky -- ri --
  e e -- _ lei --
  son, Ky -- ri --
  e,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
