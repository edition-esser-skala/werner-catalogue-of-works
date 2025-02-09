\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Grave"
  a'8^\partSc f' c a f c' a f
  d4. d8 cis4 r
  r fis8 a b b16 a g4
}

text = \lyricmode {
  Et in ter -- ra pax, in ter -- ra,
  ter -- ra pax,
  pax ho -- mi -- ni -- bus "bo -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
