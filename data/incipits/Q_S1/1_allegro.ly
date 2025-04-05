\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d'4 fis
    a r16 a( h cis)
    d8 d4 d8
    d d4 d8
    cis32( h a8.) h8 h
    a32( g fis8.) g8 g
    fis16 e d8 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d'4 fis
    a r16 a( h cis)
    d8 d4 d8
    d d4 d8
    cis32( h a8.) h8 h
    a32( g fis8.) g8 g
    fis16 e d8 r4
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d4 fis
    a r8 a
    fis g a g
    fis g a h
    e,4 e8 g
    d4 cis8 cis
    a4 r
  }
}

Cello = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d4 fis
    a r8 a
    d, e fis e
    d e fis g
    a4 g8 e
    fis4 e8 a,
    d4 a'16 g fis e
  }
}

Continuo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d4 fis
    a r8 a
    d, e fis e
    d e fis g
    a4 g8 e
    fis4 e8 a,
    d4 a'16 g fis e
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
