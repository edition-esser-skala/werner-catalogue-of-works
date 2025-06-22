\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    \partial 8 g''16 d g, a h c d8 g16 d g, a h c d8 h'-!
    h-! g-! g-! d-! d-! h-! h h'16 g
    d e fis g a8 h16 g d e fis g a8 d-!
    d-! a-! a-! fis-! fis-! d-! d-! h'-!
    h-! g-! g-! e-! e-! cis-! cis-! a'-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    \partial 8 g''16 d g, a h c d8 g16 d g, a h c d8 g-!
    g-! d-! d-! h-! h-! g-! g h'16 g
    d e fis g a8 h16 g d e fis g a8 fis-!
    fis-! d'-! d-! a-! a-! fis-! fis-! g-!
    g-! e-! e-! cis-! cis-! a-! a-! a'-!
  }
}

ViolinoIII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    \partial 8 g''16 d g, a h c d8 g16 d g, a h c d8 h'-!
    h-! g-! g-! d-! d-! h-! h h'16 g
    d e fis g a8 h16 g d e fis g a8 d-!
    d-! a-! a-! fis-! fis-! d-! d-! h'-!
    h-! g-! g-! e-! e-! cis-! cis-! a'-!
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    \partial 8 g8 g g g g g g g g
    g g g g g g g g
    d' d d d d d d d
    d d d d d d d g
    g g g g a a, a a
  }
}

BassFigures = \figuremode {
  r8 r1
  r
  r
  r
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "vl 2"
          \ViolinoII
        }
        \new Staff {
          \set Staff.instrumentName = "3"
          \ViolinoIII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
      \new FiguredBass { \BassFigures }
    >>
  >>
}
