\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key a \minor \time 2/4 \tempoMarkup "Allegro"
    a'8 c16 h a4~
    a8 c16 h a8 c
    h16 c d8~ d16 c c h
    c8 a16 h c d e f
    g8 g, e'16 d e8 %5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key a \minor \time 2/4 \tempoMarkup "Allegro"
    r8 e c'16 h c8
    r a a'16 gis a8
    a gis16 fis? e8 d
    c16 h a8 r4
    c8 e16 d c4
  }
}

Basso = {
  \relative c {
    \clef bass
    \twofourtime \key a \minor \time 2/4 \tempoMarkup "Allegro"
    a'4. g8
    f4. e8
    d4 e
    a8 g16 f e8 d
    c4. h8
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
