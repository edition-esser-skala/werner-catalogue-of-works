\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Larghetto"
  g'2^\partSc a
  g4 c, c'2~
  c b
  a2. b?8[ a]
  g2
}

text = \lyricmode {
  San -- _
  _ _ _
  _
  _ _
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
