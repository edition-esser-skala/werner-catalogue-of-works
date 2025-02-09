\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Allegro"
    \tuplet 3/2 4 { d8 cis d fis[ e fis] a g a d[ cis d] }
    fis( d) cis( h) a2
    h8( g) fis( e) d4 a8 g'
    fis4 d2 a8(\p g')
    fis( d) e( g) fis( d) e( g)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Allegro"
    \tuplet 3/2 4 { d8 cis d fis[ e fis] a g a d[ cis d] }
    fis( d) cis( h) a2
    h8( g) fis( e) d4 a8 g'
    fis4 d2 a8(\p cis)
    d( fis) cis( e) d( fis) cis( e)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twotwotime \key d \major \time 2/2 \tempoMarkup "Allegro"
    d4 fis a d~
    d cis8 h a2
    g4 fis8 e d4 a
    d fis8 a d4 a\p
    d, a' d, a
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r4 <6>2 <7>4
  <3> <5>8 <7> r2
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
