\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    \partial 4 a'4~ a c8 d e4~
    e a8 h c4
    h a gis
    a a, g'~
    g f e~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    \partial 4 r4 c'8 h a2
    a'8 g f2
    f4 e8 d c h
    a4 e'2~
    e4 d c!8 h
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    \partial 4 r4 a'2 g4
    f2 e4
    d2 e4
    cis2 a4
    d2 e4
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
