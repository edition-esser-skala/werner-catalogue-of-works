\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Menuet"
    a'4 d d
    d8( cis) \appoggiatura cis4 e2
    e8( d) fis4 a,
    R2.
    r4 a' a
    a8 a, g4 g
    g8 cis, fis4 fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "Menuet"
    R2.*2
    a4 d d
    d8 cis e2
    e8 d fis4 a,
    h' h8 e, h'4
    a a8 d, a'4
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "Menuet"
    d'4 fis,8 e fis d
    a'4 a, g'
    fis d8 e fis d
    a'4 a, g'
    fis d fis
    g e r
    fis d r
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
