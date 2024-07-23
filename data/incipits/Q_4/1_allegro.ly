\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    d'4. g8 e d4 c16 h
    c8 h4 a16 g a8 g r4
    d'4. e8 d h( a g)
    d'4. e8 d g a h
    c4 h a16 g fis e d4
  }
}

Violino = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    h'8 g16 a h8 g c h4 a16 g
    e'8 d4 c16 h c8 h r4
    d4. e8 d h( a g)
    d'4. e8 d g( a h)
    c4 h a16 g fis e d4
  }
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    g'4 r g r
    g, r d'8 g, r4
    g'8 a h c h g r4
    g8 a h c h4 r8 g
    fis4 g d r8 g
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
