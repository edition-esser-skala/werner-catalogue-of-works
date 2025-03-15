\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 3/2 \tempoMarkup "Allegro" \autoBeamOff
  r4^\partTc e2 c4 a f
  d' h8[ c] d4 h g e
  c' a8[ h] c4 a f d
}

text = \lyricmode {
  Ky -- ri -- e e -- 
  lei -- _ son
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
