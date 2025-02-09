\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace moderato"
  g'4^\partSc r8 g g e r c'
  c g r e' d4. g8
  e4 r8 e c4 r8 f
}

text = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra
  pax, pax, pax, pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
