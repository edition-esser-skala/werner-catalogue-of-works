\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  a'2^\partSc a4 a
  b2 g4 g4
  f2 e
  d f
}

text = \lyricmode {
  E -- gre -- di --
  en -- tem de
  tem -- _
  plo, a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
