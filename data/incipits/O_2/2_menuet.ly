\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    d'2.
    fis16([ e8.) d16( cis8.) h16( a8.)]
    g4~ \tuplet 3/2 4 { g8 a h } a g
    g4 fis8( g) g8.\trill fis32 g
    a8 d, \afterGrace fis'4 e8 \afterGrace d4 cis8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    d'2.
    fis16([ e8.) d16( cis8.) h16( a8.)]
    g4~ \tuplet 3/2 4 { g8 a h } a g
    g4 fis8( g) g8.\trill fis32 g
    a8 d, \afterGrace fis'4 e8 \afterGrace d4 cis8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    d4 e fis
    cis2.
    h4 e cis
    d, d' e
    fis d fis
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  q2 q8 <5>
  <4>4 <3>2
  <6>2 q4
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
