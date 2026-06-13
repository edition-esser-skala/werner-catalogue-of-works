\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r2^\partSs d'4. d8
  a4 a8 a b2
  b4 b a4. a8
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui ve --
  nit in no -- "mi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
