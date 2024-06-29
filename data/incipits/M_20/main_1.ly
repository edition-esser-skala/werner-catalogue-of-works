\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/4 \tempoMarkup "Largo"
  e'2.~^\partVii
  e4 dis h
  c2.
  \set Staff.forceClef = ##t \clef treble h'2.~^\partVi
  h4 ais fis
  g2.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
