\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  a'\breve*1/2^\partSc
  g1
  r2 a~
  a4 a a2
  b1~
  b2 a
  a1
}

text = \lyricmode {
  Ec --
  ce
  quo --
  mo -- do
  mo --
  ri --
  tur
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
