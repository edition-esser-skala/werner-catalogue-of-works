\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r4^\partSc g' a8[ g] c4
  b a g2
  r g~
  g g
}

text = \lyricmode {
  San -- _ _
  _ _ ctus,
  san --
  ctus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
