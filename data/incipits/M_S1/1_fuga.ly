\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    r2 a''
    fis h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    d'2 h
    e cis
    fis e4 d~
    d cis d8 cis fis e~
    e d16( cis) d2 cis4
    r8 a a a d, d' d16( cis) d8
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    r2 r8 d d d
    g, g' g16( fis) g8 r e e e
    a, a' a16( g) a8 h a16 g fis8 g
    fis e16 d e4 d8 e a,4
    r2 r8 a a a
    d, d' d16( cis) d8 r h h h
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    r8 d d d g, g' g16( fis) g8
    r e e e a, a' a16( g) a8
    r d, e fis g a h4
    a4. g8 fis e d cis
    h2 a
    R1
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
  >>
}
