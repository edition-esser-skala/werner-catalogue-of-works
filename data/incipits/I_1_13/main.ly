\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key a \minor \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
  a2.^\partBc a4
  \clef tenor e'2.^\partTc e4
  a,2 d
  c1
  h2 e
}

text = \lyricmode {
  Al -- ma
  Al -- ma %2
  Re -- dem --
  pto --
  ris "Ma -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
