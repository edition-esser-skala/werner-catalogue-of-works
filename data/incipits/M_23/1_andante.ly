\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Andante"
    g''4~ g16 es d c
    \grace c8 h4 c
    d8 es16 f \grace f es8 d16 c
    h( d) g,8 r g16 a
    \sbOn h c \tuplet 3/2 8 { d es f } \sbOff \grace f es8 d16 c %5
    h d g,8 r g'16 as
  }
}

Violino = {
  \relative c' {
    \clef treble
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Andante"
    g''4~ g16 es d c
    \grace c8 h4 c
    d8 es16 f \grace f es8 d16 c
    h( d) g,8 r4
    g8\p h c fis,
    g16( fis) g8 g, e''16\f f
  }
}

Basso = {
  \relative c {
    \clef bass
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Andante"
    c8 d es f
    g f es d16 c
    h4 c
    r8 g'16 fis g8 g,
    R2
    r8 g'16\p fis g8 g,
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
