\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Extravaganza"
    e'4. e8 e4 f
    e a, d c8 h
    c d e4. f8 g a
    d,4 e2 d4
    r e,8 f g a h c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Extravaganza"
    r4 e a8 gis a h
    c2~ c8 h fis gis
    a h c2 h8 a
    h4 e, a h
    c2 h
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Extravaganza"
    R1*2
    r4 a8 h c d e f
    g4 c, f2
    e4 e'2 d8 c
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
