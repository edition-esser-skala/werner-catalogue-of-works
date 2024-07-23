\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "Cantabile"
    R1.*2 \gotoBar "6"
    h'2 g4( e) e'( g)
    fis2. h,4 h'2
    g e r4 e
    gis2 gis2.\trill fis8 gis
  }
}

Violino = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "Cantabile"
    r4 e g h e g
    r h, dis fis h fis \gotoBar "6"
    r g\p e h g h
    r h dis fis h fis
    r g e h g e
    r e gis h e gis
  }
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "Cantabile"
    e2 e e
    dis dis dis \gotoBar "6"
    e\p e e
    dis dis dis
    e e e
    d! d d
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
