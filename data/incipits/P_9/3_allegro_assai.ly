\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    d'4.~
    d16 g fis8 e
    d16( c') h8 a
    g4 r8
    h( g e)
    \grace d cis4.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    h'4.~
    h16 e d8 c
    h16( a') g8 fis
    g h, d~
    d h' r
    r e, g,
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \major \time 3/8 \tempoMarkup "Allegro assai"
    g'8 g g
    g,4 r8
    g' d' d,
    g d h
    g4 r8
    a' a, h
  }
}

BassFigures = \figuremode {
  r4.
  r
  r8 <6 4> <5 3>
  r4.
  r
  r8 <_+> <6>
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
