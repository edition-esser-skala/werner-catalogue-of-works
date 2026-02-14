\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  c'2^\partSc cis
  d2. c4
  b2 a
  gis4 a2 \hA gis4
  a
}

text = \lyricmode {
  San -- _
  _ ctus,
  san -- ctus,
  san -- _ _
  ctus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
