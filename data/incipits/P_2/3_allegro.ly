\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    h'16 d g8 g
    g8. fis32( g) a8
    d,16 g h8 h
    h8. a32( h) c8
    d d, d
    c' d, d
    h' a g
    fis e16 fis d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    R4.*2
    h'16 d g8 g
    g8. fis32( g) a8
    h d, d
    a' d, d
    g fis e
    fis e16 fis d8
  }
}

ViolinoIII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    h'16 d g8 g
    g8. fis32( g) a8
    d,16 g h8 h
    h8. a32( h) c8
    d d, d
    c' d, d
    h' a g
    fis e16 fis d8
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 3/8 \tempoMarkup "Allegro"
    g8 g' g
    d d, d
    g g' g
    d d, d
    g'16 a h c d g,
    fis g a h c fis,
    g a h c d g,
    d8 d16 c h a
  }
}

BassFigures = \figuremode {
  r4.
  r
  r
  r
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
