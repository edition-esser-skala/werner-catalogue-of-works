\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  r4^\partSc e' e e e2
  r4 e e e e2
  r4 cis fis2 r4 dis
}

text = \lyricmode {
    Lae -- ta -- tus sum,
  lae -- ta -- tus sum
  in his, quae
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
