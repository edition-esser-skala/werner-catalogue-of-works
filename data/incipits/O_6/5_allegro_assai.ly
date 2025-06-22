\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    g'16 a h8 cis
    d e fis
    g h, cis
    d4 r8
    g,16\p a h8 cis
    d e fis
    g h, cis
    d4 r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    g'16 a h8 g
    a16( g) a8 d
    h16( a) g8 e
    fis16( e) fis8 r
    g16\p a h8 g
    a16( g) a8 d
    h16( a) g8 e
    fis16( e) fis8 r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    g'4.
    fis8 e d
    e4.
    d8 d'\p c
    h a g
    fis e d
    e4.
    d8\f d'16 c! h8
  }
}

BassFigures = \figuremode {
  r4.
  <6>
  <5>4 <6\\>8
  r4.
  <6>4 <4\+>8
  <6>4.
  <5>4 <6\\>8
  r4 <6>8
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
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
