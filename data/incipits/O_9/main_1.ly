\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 2/8 \tempoMarkup "Vivace"
  \tuplet 3/2 8 { e'16[^\partVi fis e } a8]
  \tuplet 3/2 8 { e16[ fis e } cis'8]
  \tuplet 3/2 8 { e,16[ fis e } a8]
  \tuplet 3/2 8 { e16[ fis e } cis'8]
  e,16[ d32 cis h16 d]
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
