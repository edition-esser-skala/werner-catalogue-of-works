\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
  c2^\partBc c'4
  d,2 h'4
  \clef tenor g2^\partTc g'4
  a,4 d2
  \clef alto d2^\partAc h'4
  c,2 f4
}

text = \lyricmode {
  Et in
  ter -- ra
  Et in
  ter -- ra
  Et in
  ter -- ra
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
