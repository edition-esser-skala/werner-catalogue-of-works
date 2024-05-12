\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
    a'8. h16 h8. a32( h)
    cis8 a16 h cis d e8
    fis a, gis e'
    cis a16 h cis d e8
    fis a, gis e'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
    R2*5
  }
}

Violoncello = {
  \relative c' {
    \clef tenor
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
    R2*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
    a8 a' gis e
    a4 r8 cis,
    d4 e
    a, r8 cis
    d4 e
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
