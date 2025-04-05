\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    d8 \tuplet 3/2 8 { fis16 e d } d'8~
    d cis h
    a \tuplet 3/2 8 { cis16 h a } g'8~
    g fis e
    fis d a'
    a( h) a-!
    a( h) a-!
    a( h) a-!
    a16( g) g( fis) fis( a)
    g8 e, h'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    d8 \tuplet 3/2 8 { fis16 e d } d'8~
    d cis h
    a \tuplet 3/2 8 { cis16 h a } g'8~
    g fis e
    fis d fis~
    fis g fis-!
    fis g fis~
    fis g fis-!
    fis16 e e dis dis fis
    e8 e, h'
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    fis4 a8
    fis4 d8
    e4 d8
    cis4 a8
    a4 d8
    d4.
    e
    dis
    dis
    h8 e h'
  }
}

Cello = {
  \relative c {
    \clef bass
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    d4 fis8
    a4 h8
    cis4 h8
    a4 cis8
    d4 d,8
    fis4.
    e
    dis
    h
    e8 e h'
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    d4 fis8
    a4 h8
    cis4 h8
    a4 cis8
    d4 d,8
    fis4.
    e
    dis
    h
    e8 e h'
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
        \set Staff.instrumentName = \markup \center-column { "vlc" "solo" }
        \Cello
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
