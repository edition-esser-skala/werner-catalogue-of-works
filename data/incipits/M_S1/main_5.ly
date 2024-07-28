\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Adagio ma poco"
  r4^\partVii a'2 g4
  f2*1/2\trill \set Staff.forceClef = ##t d'2^\partVi c!4
  b2\trill a4 a'~
  a g8 f e4 c'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
