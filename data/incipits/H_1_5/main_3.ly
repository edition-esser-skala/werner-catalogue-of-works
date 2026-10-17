\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  r8^\partSc e'16[ f] g8 d e4 r
  r c c h8[ c16 d]
  e8 d16[ c h8] a g4 g
}

text = \lyricmode {
  Lae -- ta -- tus sum
  in his quae
  di -- cta __ sunt mi -- hi:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
