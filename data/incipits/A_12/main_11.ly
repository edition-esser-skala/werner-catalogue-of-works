\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Jobs Frau" c' c16 c f c d8. a16 a8 a16 b
  c8 c es d b b r \hA b16 d
  c8 f, es' d b4 d8 \hA b
}

text = \lyricmode {
  Ey, ey, wie gar ein from -- men Mann ha -- be
  ich doch ü -- ber -- khom -- men, je -- zo
  ſe -- he ich den Lohn, wie das
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
