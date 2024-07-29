\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 3/8 \tempoMarkup "[no tempo]"
  \partial 8 c'8~^\partUnk c16 c c8 es~
  es16 es es8 f~
  f16 g g g g \tuplet 3/2 16 { a32 h g }
  c8 c, c'
  c c, c'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
