\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
  d4^\part "Schullmeiſter" d d
  d2 d4
  e2 d4
  d2 r4
}

text = \lyricmode {
  Mir habn än
  Rich -- ter
  oä -- nen
  Mann
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
