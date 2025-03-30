\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  r4^\partSc c' g'2
  g4 e d d8 d
  e4 e16[ f e f] g2
  g,4 g c c8 c
}

text = \lyricmode {
  Te De --
  um lau -- da -- mus, lau --
  da -- _ _
  mus, te Do -- mi -- num
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
