\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 6/8
    e'8. f16 e8 dis h' r
    d,8. e16 d8 cis a' r
    c,8. d16 c8 h g' r
    a, f' r \grace a, gis4 f'8
    e e, d' c8. h16 a8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 6/8
    R2.*5
  }
}

Violoncello = {
  \relative c' {
    \clef tenor
    \key a \minor \time 6/8
    R2.*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 6/8
    a'4 r8 h gis16 fis? gis8
    r fis gis a fis16 e fis8
    r e fis g e16 d e8
    f d16 c d8 e e' d
    c4 h8 a e f
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
        \set Staff.instrumentName = \markup \center-column { "vlc" "solo" }
        \Violoncello
      }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
  >>
}
