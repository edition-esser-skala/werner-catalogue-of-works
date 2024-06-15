\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    a'8 c e4 gis
    a a, r
    c' h8 a g! f
    e4 d r
    g2 \tuplet 3/2 4 { a8 h c }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    R2.
    a8 c e4 gis
    a a, r
    c' h8 a g! f
    e4 c r
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    a4 c' h
    a c, e
    a g! h,
    c g h
    c h a
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
