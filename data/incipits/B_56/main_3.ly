\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  g'2^\partSs e4 f
  e d g2
  a e'4^\partSc g8 g
  e e d d r e g g
}

text = \lyricmode {
  Cre -- do in
  u -- num De --
  um, Pa -- trem o --
  mni -- po -- ten -- tem, Pa -- trem "o -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
