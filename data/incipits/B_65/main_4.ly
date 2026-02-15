\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d'2^\partSc cis
  r c
  c r
  b a
}

text = \lyricmode {
  San -- ctus,
  san --
  ctus,
  san -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
