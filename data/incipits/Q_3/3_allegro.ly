\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8 \tempoMarkup "Allegro"
    R4.*8
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8 \tempoMarkup "Allegro"
    a'8 a( h)
    cis cis( d)
    e fis gis
    a a, r
    cis' cis( h)
    a a( gis)
    fis e dis
    e4 r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8 \tempoMarkup "Allegro"
    R4.
    a'8 a( h)
    cis d h
    cis4 r8
    R4.
    cis'8 cis( h)
    a gis( fis)
    e4 r8
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/8 \tempoMarkup "Allegro"
    a'8 a, r
    a' a, r
    a' d, e
    a, cis e
    a,4 r8
    r r e'
    fis gis16 a h8
    e, h e,
  }
}

\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = "fl"
      \Flauto
    }
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
  >>
}
