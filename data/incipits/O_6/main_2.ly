\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/4 \tempoMarkup "Menuet[to] Cancrizante"
  g'2.^\partVi
  fis8( g) g( a) a( h)
  g( h) d4 \tuplet 3/2 4 { e8 fis g
  fis e d c h a } h4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
