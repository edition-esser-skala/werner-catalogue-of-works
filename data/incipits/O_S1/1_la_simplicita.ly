\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "La Simplicita"
    \partial 8 d'16 e
    fis8 e16 d fis8 a
    e4 a,
    fis8 e16 d fis8 a
    e4 a,
    fis'' e16 d cis h
    a8 gis a h
    cis d e e,
    a e16 d cis8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "La Simplicita"
    \partial 8 r8
    r a' d4~
    d8 cis16 h cis d e8
    r a,, d4~
    d8 cis16 h cis d e8
    a,4 r8 gis'
    a gis a h
    cis d e e,
    a gis16 fis e8 cis
  }
}

Basso = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "La Simplicita"
    \partial 8 r8 d'4 d,
    a' r
    d, d,
    a' r
    d r8 e
    fis gis a h
    cis d e e,
    a,4 r8 a'
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
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
  >>
}
