\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
  d4^\partSs d'8 d c4 a b2
  a4 f f' e d c8 c
  b2 a4 a b fis
}

text = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- _ "si -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
