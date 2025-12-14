\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
  c'2^\partSc c c
  c r4 c c c
  c2 c4 c c2
  c4 g c2. c4
}

text = \lyricmode {
  Lae -- ta -- tus
  sum in his, quae
  di -- cta sunt mi --
  hi: In do -- mum
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
