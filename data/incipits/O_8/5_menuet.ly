\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f'4. e16( d) c4
    c16( d8.) d16( c8.) c16( b8.)
    b4\trill a r
    g16( a b c) d8( b) g( f)
    \grace a e2 f4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f'4. e16( d) c4
    c16( d8.) d16( c8.) c16( b8.)
    b4\trill a r
    g16( a b c) d8( b) g( f)
    \grace a e2 f4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "[no tempo]"
    f8 g a4 e
    f e a
    d, c r
    b g h
    c c'8 b! a4
  }
}

BassFigures = \figuremode {
  r4 <6> q
  <5>8 <6> <7> <6> <3> <2>
  <6>4 q2
  q q8 <5>
  r2 <6>4
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
