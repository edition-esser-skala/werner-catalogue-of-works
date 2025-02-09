\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key d \major \time 2/2 \tempoMarkup "Andante"
  d'1^\partVi
  fis
  e
  a2. a,,4 \gotoBar "26"
  \clef bass d,1^\partBs
  fis
  e
  a2. a,4
}

text = \lyricmode {
  \skips 5
  Lau --
  da
  Si --
  on "Sal -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
