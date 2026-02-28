\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  e'4^\partSc c d h
  r8 c d d d d r4
  \clef tenor d,1^\partTc
  h4 c h a
}

text = \lyricmode {
  Cre -- do, cre -- do
  in u -- num De -- um,
  cre --
  do in u -- num
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
