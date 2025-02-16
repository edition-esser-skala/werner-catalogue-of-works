\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Andante cantabile"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 g'' c~
    c h8 as g f
    es4 c r
    r d g~
    g8 f es d c4
    r c f
  }
}

Violino = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Andante cantabile"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 g' c~
    c h8 a g f
    es4 c c'~
    c8 b! as g f es
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "Andante cantabile"
      \once \override Staff.TimeSignature.style = #'single-digit
    c8 h c d es f
    g4 g, r
    c8 h c d es f
    g4 g, r
    c c'8 b! as g
    f2 r4
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
        \set Staff.instrumentName = "bc"
        \Basso
      }
    >>
  >>
}
