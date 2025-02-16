\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    g''4 c, h
    c g r
    g\p es d
    es d r
    g'\f as g
    c \appoggiatura es,8 d2
    b'4 \appoggiatura d,8 c2
  }
}

Violino = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    g''4 c, h
    c g r
    r g,\p g
    g h r
    g''\f as g
    c \appoggiatura es,8 d2
    b'4 \appoggiatura d,8 c2
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "[no tempo]"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4 es g
    es h r
    r c\p h
    c g r
    r c'\f b!
    as b \hA as
    g as g
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
