\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  a'4^\partSs a2 c4 b a8[ g]
  a4 a8[ b] c[ d] e4 f2
  e a,4^\partSc d2 h4
}

text = \lyricmode {
  Lau -- da -- te Do -- mi --
  num, o -- _ mnes gen --
  tes, lau -- da -- te
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
