\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "La Confusione"
    \partial 2 r4 r
    R2.
    r4 a''4. fis8
    h4 gis e16 fis gis e
    a4 a,4. fis8
    h4 r8 gis cis a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "La Confusione"
    \partial 2 d'4. h8
    e4 cis a16 h cis a
    d8 a e' a, fis'4
    fis16 e d cis h cis d h gis8 e
    e'4. cis8 fis4
    r8 e, gis e a4
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "La Confusione"
    \partial 2 r4 g'~
    g8 e a4 g
    fis cis d~
    d8 h e4 d
    cis r d~
    d8 h e4 r8 cis
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
