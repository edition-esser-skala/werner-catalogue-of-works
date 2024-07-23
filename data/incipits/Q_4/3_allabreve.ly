\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Allabreve"
    \partial 4 g'8 a \tuplet 3/2 2 { h4 c h } h c
    d h r c
    d h r c
    d h r g'
    \tuplet 3/2 2 { fis g fis e fis e }
  }
}

Violino = {
  \relative c' {
    \clef treble
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Allabreve"
    \partial 4 r4 \tuplet 3/2 2 { g' a g } g a
    h g r a
    h g r a
    h g r2
    r r4 g'
  }
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Allabreve"
    \partial 4 r4 g'2 r
    r4 g g,2
    r4 g' g,2
    r4 g' g,2
    R1
  }
}


\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = "fl"
      \Flauto
    }
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = "vl"
      \Violino
    }
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
  >>
}
