\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo giusto"
  h4.^\part "Schullmeiſter" h8 h4 a h2
  r r r4 h8[ c]
  d4. g,8 g4 a h2
}

text = \lyricmode {
  Än -- mahl äns iſt äns
  ä
  Nul -- la daß iſt käns
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
