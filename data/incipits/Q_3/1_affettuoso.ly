\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Affettuoso"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*5
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Affettuoso"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 e' a4. h16( gis)
    a8 e a4. h16( gis)
    a8 e fis a,( gis) e'
    \grace d cis4 r8 e dis a'
    gis( a) h e, dis a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Affettuoso"
      \once \override Staff.TimeSignature.style = #'single-digit
    r8 e' a4. h16( gis)
    a8 e a4. h16( gis)
    a8 e fis a,( gis) e'
    \grace d cis4 r8 e dis a'
    gis( a) h e, dis a'
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Affettuoso"
      \once \override Staff.TimeSignature.style = #'single-digit
    a4 cis e
    a, cis e
    cis d e
    a,8 a' gis4 fis
    e8 a, gis4 fis
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
