\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro assai"
    d'4.
    cis16( e) a,4
    g16( h) a,4
    fis'16( a) d,4
    a'8 fis'( e
    d cis h)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro assai"
    fis8 a fis
    e cis' r
    cis, e cis
    a fis' r
    fis( a g)
    fis( a g)
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 3/8 \tempoMarkup "Allegro assai"
    d8 fis d
    a'4 r8
    a, cis a
    d d' a
    d,4 r8
    R4.
  }
}

BassFigures = \figuremode {
  r4.
  r
  r
  r
  r
  r
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
