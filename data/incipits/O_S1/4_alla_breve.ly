\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Allabreve"
    \partial 2 r2
    R1*3
    r2 a''~
    a gis4 fis
    e fis gis a
    h cis d2~
    d cis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Allabreve"
    \partial 2 d'2~
    d cis4 h
    a h cis d
    e fis g2~
    g fis4 e
    d cis h a
    gis fis e fis
    gis a h2~
    h a4 h
  }
}

Basso = {
  \relative c {
    \clef bass
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Allabreve"
    \partial 2 d2
    e a~
    a g4 fis
    e2 d4 cis
    d2. cis4
    h1
    e
    e,
    a
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
