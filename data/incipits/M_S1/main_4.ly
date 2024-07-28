\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "Grave"
  r8^\partVii c es fis g g, g'4
  \set Staff.forceClef = ##t c2^\partVi h
  as' g
  r8 c, es fis g g as h
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
