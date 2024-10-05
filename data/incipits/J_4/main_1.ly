\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  r2^\partSc r r4 h'
  c2 c r4 h
  c2 c r4 h
  c2 c4 c c e
  d2 d r
}

text = \lyricmode {
  Te
  De -- um lau --
  da -- mus, te
  Do -- mi -- num con -- fi --
  te -- mur
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
