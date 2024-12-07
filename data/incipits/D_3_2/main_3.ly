\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  d'1.^\partSc d2
  c2. c4 b1
  b1. es2
  a,1 b2 h
}

text = \lyricmode {
  Ec -- ce
  vi -- di -- mus
  e -- _
  um non "ha -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
