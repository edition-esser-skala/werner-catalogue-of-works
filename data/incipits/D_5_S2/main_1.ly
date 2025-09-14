\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 8/4 \tempoMarkup "[no tempo]"
    \once \omit Staff.TimeSignature
  e\breve*1/8^\partBc f f d f e f e \bar "||"
  \clef soprano \time 2/2 a'2^\partSc a4 a
  b2 g4 g
  f2 e
  d f
}

text = \lyricmode {
  Vi -- _ di __ _ _ a -- _ quam
  e -- gre -- di --
  en -- tem de
  tem -- _
  plo a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
