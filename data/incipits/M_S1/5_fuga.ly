\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Presto"
    r8 h' a g fis g a4
    r8 c h a g a h4
    r8 d g h e, c' c16( h) a8
    d, h' h16( a) g8 c, d e fis
    g a16 h a8 g d' d, e fis %5
    g cis, d e fis d, e fis
    g2 e'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Presto"
    R1*5
    r2 r8 fis' e d
    cis d e4 r8 g fis e
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Presto"
    R1*5
    r2 d
    e4. cis8 a4 e'
  }
}

Continuo = {
  \relative c {
    \clef bass
    \twotwotime \key g \major \time 2/2 \tempoMarkup "Presto"
    g'2 a4. fis8
    d4 a' h4. g8
    d4 h' c8 e a, c
    h d g, h a2
    g fis4. e16( d)
    e2 d
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
