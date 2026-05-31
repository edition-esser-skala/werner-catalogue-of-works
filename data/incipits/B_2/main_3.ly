\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  a'2^\partSs e'4 f e d
  e2 a,4 d c h
  c8[ d] e2 e,4 e d
  e2
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
