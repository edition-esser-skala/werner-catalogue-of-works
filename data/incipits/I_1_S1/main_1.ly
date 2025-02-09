\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Andante"
  c'8^\partVi c c c d16 b c g' f d e c
  b d g,,8 g g g''16 c, c8\trill a'16 c, c8\trill
}

text = \lyricmode {
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
