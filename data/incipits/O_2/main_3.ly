\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key d \major \time 2/2 \tempoMarkup "Allegro. Allabreve"
  \tuplet 3/2 4 { d8^\partVi cis d fis[ e fis] a g a d[ cis d] }
  fis( d) cis( h) a2
  h8( g) fis( e) d4 a8 g'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
