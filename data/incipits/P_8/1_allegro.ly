\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d'16( a) a4.
    h16( g) a4.
    g'16( e) a,4 g'16( e)
    fis8 d, r4
    g16(\p e) a,4 g'16( e)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d16( fis) fis4.
    g16( e) fis4.
    cis'8 cis4 e16( cis)
    d8 fis, r4
    cis8\p cis4 e16( cis)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    d8 d d d
    d d d d
    a a a a
    d d d d
    a\p a a a
  }
}

BassFigures = \figuremode {
  r2
  <6 4>8 <5 3>4.
  <7>2
  r
  <7>
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
