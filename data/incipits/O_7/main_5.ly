\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/8 \tempoMarkup "Vivace"
  d''8.^\partVi cis32 h a16 g
  f e d c! b! a
  g f e d cis b!
  a4 r8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
