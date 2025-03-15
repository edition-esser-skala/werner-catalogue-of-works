\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  g'2^\partSc g4. a16[ h]
  c8[ e] d[ c] h[ a] g[ f]
  e e' d c16 c g'4 g,
}

text = \lyricmode {
  Cum San -- _
  _ cto Spi -- ri --
  tu
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
