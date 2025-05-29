\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
  g'4^\partSc e r
  c' g r
  e'4. d16[ c] d8 d
  c[ a16 h] c8 d e4
}

text = \lyricmode {
Ve -- ni,
  ve -- ni,
  ve -- ni San -- cte
  Spi -- _ ri -- tus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
