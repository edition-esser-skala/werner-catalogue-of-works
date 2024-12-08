\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 6/8 \tempoMarkup "Allegro non troppo"
  r8 c'16^\partVi d es8 d g c,~
  c h es\p d g c,~
  c h as'\f g g, f'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
