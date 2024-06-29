\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key g \minor \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  d'1^\partSc
  es
  d2 c
  d1
  g,2 g4 a
  b a b c
}

text = \lyricmode {
  O! __
  _
  _ _
  cle --
  mens, o __ _
  _ _ _ _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
