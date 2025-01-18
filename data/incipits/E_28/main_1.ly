\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
  r4^\partSc r d'
  d g e
  d h a
  h r d
}

text = \lyricmode {
  Ô
  längſt _ er --
  wünsch -- _ te
  Nacht voll
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
