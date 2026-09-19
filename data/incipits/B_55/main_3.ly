\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante moderato"
  a'2^\partSs c4 h a gis
  a e r c' f2
  e4 c a f e d
  c2 r r
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto --
  rem coe -- li et ter -- _
  rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
