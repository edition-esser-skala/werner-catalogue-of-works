\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Largo"
    e'1 d2
    c4( e) g2 r
    a,\p g4( e) f( d)
    e( d) e2 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/2 \tempoMarkup "Largo"
    c'1 h2
    e,4( c') c2 r
    c,\p e4( c) d( h)
    c( h) c2 r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Largo"
    c2 g' g,
    a e r
    f'\p g g,
    c c, r
  }
}

BassFigures = \figuremode {
  r2 <6 4>1
  <5>2 <6>1
  r2 <6 4> <5 3>
  r1.
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
