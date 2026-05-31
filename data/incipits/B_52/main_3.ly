\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  c'4^\partSs f,8 f' d c16[ b] a[ b a b]
  c8 f, b16[ c] d8 c16[ d c b] a8 f'
  d b g[ f] e4 r
}

text = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li, coe --
  li et ter -- rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
