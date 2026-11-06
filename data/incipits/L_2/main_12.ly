\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schullmeiſter" h h16 h e h g8. g16 g8 h
  d d d h16 g e'8. e16 e8 e
}

text = \lyricmode {
  Mei Moä -- nung bleibt halt wie zu -- vor daß
  man den Par -- thl alß Se -- ni -- or zum
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
