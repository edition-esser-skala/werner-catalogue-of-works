\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
    d'8 es f2
    f8( es) d4 c
    b r r
    g'8 a b2
    a8( g) f4 es
    d r r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
    d'8 es f2
    f8( es) d4 c
    b r r
    g'8 a b2
    a8( g) f4 es
    d r r
  }
}
BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 3/4 \tempoMarkup "[no tempo]"
    b4 b' a
    g f es
    d r r
    es2 d8 es
    f4 g a
    b r r
  }
}

BassFigures = \figuremode {
  r2 <6>4
  <7>8 <6> q4 q
  q2.
  r2 q4
  r <7> <5>
  <3>2.
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
