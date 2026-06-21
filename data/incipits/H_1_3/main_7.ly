\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c2^\partSc g'4 g8 g
  g4. g8 g2
  g4 g a2
  g4 r g g
}

text = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el
  de Ae -- gy --
  pto do -- mus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
