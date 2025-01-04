\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part Job f, b16 b c d es8 es r c
  a c es d b4 r8 f
  b b d \hA b g g16 g c8 g
}

text = \lyricmode {
  Ey la -- ßet mich dan ra -- ſten auf
  di -- ſen Kran -- khen -- beth, ihr
  pflegt nur an -- zu -- ta -- ſten mein Gmüth und
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
