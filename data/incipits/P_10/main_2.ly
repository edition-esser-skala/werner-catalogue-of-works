\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/4 \tempoMarkup "Largo"
  r4^\partVii d'2~
  d4 \set Staff.forceClef = ##t a'2~^\partVi
  a4 gis e
  f2 g8 f
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
