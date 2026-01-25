\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  b'2^\partSc b a
  b2. a4 b2
  c b2. b4
  a2 b4 b b b
}

text = \lyricmode {
  Be -- a -- tus
  vir, qui ti --
  met Do -- mi --
  num in man -- da -- tis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
