\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 2/4 \tempoMarkup "Vivace"
  a''8^\partVi r h r
  cis, d~ \tuplet 3/2 8 { d16[ e fis] g a h }
  cis,8 d \tuplet 3/2 8 { d,16[ e fis] g a h }
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
