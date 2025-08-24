\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'4^\partSc r d4. a8
  fis4 d r2
  a'4 r r a
  g8. g16 g4 r2
}

text = \lyricmode {
  Et, et in
  ter -- ra
  pax ho --
  mi -- ni -- bus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
