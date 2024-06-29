\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
  r4^\partSc e'2
  g4 g g
  e g e
  d d h
  g' g8 g g g %5
}

text = \lyricmode {
  Te
  De -- um, te
  De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- "fi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
