\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  r1^\partSc a'~
  a2 g a h
  c a g1
  a c~
  c2 c a1
}

text = \lyricmode {
  San --
  ctus, san -- _
  _ ctus, san --
  ctus Do --
  mi -- nus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
