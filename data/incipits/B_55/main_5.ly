\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  c'4.^\partBs a16[ h] c8 c,4 a'16[ h]
  c8 c, r d e16[ c'] h a g8. f16
  e4 r r2
}

text = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit in no -- mi -- ne Do -- mi --
  ni,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
