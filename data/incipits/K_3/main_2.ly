\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  h4^\partTc a g a
  a2 g4 r
  r2 g4^\partTs a
  h h8 h h4 h8 h
  h4 h h h8 h
}

text = \lyricmode {
  La -- _ _ _
  med. __ _
  Ma -- _
  _ tri -- bus su -- is di --
  xe -- runt: U -- bi est
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
