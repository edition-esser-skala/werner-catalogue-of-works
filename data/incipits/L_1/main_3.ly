\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  r2^\part "Sagfäller" f~
  f~ f
  d4 r r2
}

text = \lyricmode {
  Sag --

  fälln
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
