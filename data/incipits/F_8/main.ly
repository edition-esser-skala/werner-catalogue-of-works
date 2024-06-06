\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \dorian \time 2/1 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  d1.^\partAc c2
  f1. e2
  d1. cis2
  d
}

text = \lyricmode {
  A -- ve
  ma -- ris
  stel -- _
  la,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
