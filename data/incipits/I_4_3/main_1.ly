\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  r4^\partAs d g a fis2
  g4 a h a g2
  fis4 g e8[ fis] g4 c,4. c8
}

text = \lyricmode {
  Sal -- ve Re -- gi --
  na, Re -- gi -- na ma --
  ter mi -- se -- ri -- cor -- "di -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
