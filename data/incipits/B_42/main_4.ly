\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  d'2.^\partSc g4 fis e
  d2. e4 d c
  h2. c4 h a
  g2. g4 fis2
}

text = \lyricmode {
  San -- _ _ _
  _ _ _ _
  _ _ _ _
  _ ctus, "san -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
