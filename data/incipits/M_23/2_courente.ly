\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    \partial 8 g''8 g4. f8 es d
    c d g, c d h
    c4 g8 c c8.\trill h32 c
    d4 g,8 d' d8.\trill c32 d
    es4 g,8 es' es8.\trill d32 es
    d8 es f g as c,
  }
}

Violino = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    \partial 8 g''8 g4. f8 es d
    c d g,4 h
    c8 g es g c,4
    r8 d' h d g,4
    r8 g es g c,4
    r8 c d es f es
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    \partial 8 r8 c4 d es
    f g g,
    c r c'
    h r g
    c r c,
    f r f,
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
