\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  g2^\partTs \clef alto c^\partAs
  d4 f2 e4
  r f e d
  c r d2
}

text = \lyricmode {
  Be -- Be --
  ne -- di -- ctus,
  qui ve -- _
  nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
