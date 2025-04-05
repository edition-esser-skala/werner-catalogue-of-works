\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/8 \tempoMarkup "Tempo variabile"
  \partial 8 d'8^\partVi cis[ e d fis]
  e16 fis g e fis8 d
  cis[ e d fis,]
  e16 fis g e fis8 d'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
