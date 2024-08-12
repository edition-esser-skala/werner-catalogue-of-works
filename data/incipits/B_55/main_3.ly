\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  d'4^\partSc a8 d h d e[ d16 cis]
  d4 r8 d h d e[ d16 cis]
  d8 a h d g,16[ fis] g4 fis8
}

text = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe --
  li, coe -- li et ter -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
