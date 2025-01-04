\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part Job r8 g b b b c
  d4 r8 d d d f es
  c c r g c c es c
  b
}

text = \lyricmode {
  Ô mich be -- glückh -- ter
  Job! wie werd ich wohl be --
  zah -- len mein höch -- ſten Gott und
  Herr
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
