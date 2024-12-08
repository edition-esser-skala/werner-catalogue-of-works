\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key h \minor \time 3/4 \tempoMarkup "Adagio"
  h'8.(^\partVi cis16) d4 eis
  fis8( fis,) fis4 r
  e'!8.( fis16) g4 fis8( e)
  d8.( cis16) h4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
