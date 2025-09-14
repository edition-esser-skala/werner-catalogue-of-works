\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  a'4.^\partSs h8 cis[ d] e4 a, e'
  fis e8[ d] cis4 d e d8[ cis]
  h4 cis8 h a2\trill gis4 r
}

text = \lyricmode {
  Pa -- _ trem o -- mni -- po --
  ten -- _ tem, fa -- cto -- rem
  coe -- li et ter -- rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
