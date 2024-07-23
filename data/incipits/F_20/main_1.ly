\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  r2^\partSc c' h d
  c g a2. a4
  g1 a
}

text = \lyricmode {
  Ve -- ni, cre --
  a -- tor Spi -- ri --
  tus, "cre -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
