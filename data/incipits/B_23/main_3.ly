\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/2 \autoBeamOff \tempoMarkup "Larghetto"
    \set Staff.timeSignatureFraction = 2/2
  g'2^\partSc a g4 c, c'2~
  c b a2.\trill \hA b8[ a]
  g2 c1 b2
}

text = \lyricmode {
  San -- _ _ _ _
  _ _ _
  ctus, san \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
