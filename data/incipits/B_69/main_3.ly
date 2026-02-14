\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  e'4.^\partSc d8 e4 d8 d
  c c c[ h] c e^\partSs d c
  g'16[ fis] g4 g,8 g2
}

text = \lyricmode {
  Cre -- do, cre -- do in
  u -- num De -- um, Pa -- trem o --
  mni -- _ po -- "ten -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
