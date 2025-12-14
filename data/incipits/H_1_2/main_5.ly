\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Alla capella"
  f2^\partSc a
  c c4. c8
  c2 c4 c
  d2 c
}

text = \lyricmode {
  Lau -- da --
  te Do -- mi --
  num, o -- mnes
  gen -- tes,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
