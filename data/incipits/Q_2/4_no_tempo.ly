\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8
    e'8 a, h
    cis16 h cis8 d
    e a, h
    cis16 h cis8 d
    e a gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8
    R4.
    e'8 a, h
    cis16 h cis8 d
    e a, h
    cis fis( e)
  }
}

Violoncello = {
  \relative c' {
    \clef tenor
    \key a \major \time 3/8
    R4.*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 3/8
    a'4 r8
    a4 r8
    a4 r8
    a4 r8
    a4 r8
  }
}

\score {
  <<
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
        \set Staff.instrumentName = \markup \center-column { "vlc" "solo" }
        \Violoncello
      }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
  >>
}
