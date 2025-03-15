\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  c2^\partTc c c
  d h1\trill
  c2 r r
}

text = \lyricmode {
  O -- san -- na
  in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
