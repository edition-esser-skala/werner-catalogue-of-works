\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "[no tempo]"
    \partial 8 g''8 c c, c c
    c( h) r d16 es
    f8 f f f
    f e r g16 as
    b!8 b b b
    b( a!) f as
  }
}

Violino = {
  \relative c' {
    \clef treble
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "[no tempo]"
    \partial 8 r8 r es16 f g8 es
    d g, h'4
    r8 h16 c d8 \hA h
    g c, e'4
    r8 e16 f g8 \hA e
    c f r16 d f d
  }
}

Basso = {
  \relative c {
    \clef bass
    \twofourtime \key c \dorian \time 2/4 \tempoMarkup "[no tempo]"
    \partial 8 r8 r c es c
    g'4 g,
    r8 d' h g
    c4 c,
    r8 g'' e c
    f4 r8 d
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
