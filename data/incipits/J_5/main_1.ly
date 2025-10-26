\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \tempoMarkup "Allegro" \autoBeamOff
  c'2^\partSc c c4 c
  c2 c r4 c
  c2 c4 c c f
  e2 e r
}

text = \lyricmode {
  Te De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
