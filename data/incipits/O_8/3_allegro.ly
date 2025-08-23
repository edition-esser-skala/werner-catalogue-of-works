\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f4~\trill f8. f'16
    f,4~\trill f8. f'16
    f,8.\trill f'16 f,8.\trill f'16
    f,4~ f8. f'16
    d( c) b( a) b( a) g( f)
    e'( d) c( b) c( b) a( g)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f4~\trill f8. f'16
    f,4~\trill f8. f'16
    f,8.\trill f'16 f,8.\trill f'16
    f,8. a16 c8. a16
    f8 g16( f) g4~
    g8 a16( g) a4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
    f,8. f'16 c8. a16
    f8. f'16 c8. a16
    f8. f'16 f,8. f'16
    f,8. f'16 a,8. f16
    b8. d16 g,8. b16
    c8. e16 a,8. c16
  }
}

BassFigures = \figuremode {
  <8 5 3>4 <\t \t \t>
  r2
  r
  r4 <6>
  <5>8 <6>16 <3> <8>8. <\t>16
  <5>8 <6>16 <3> <8>8. <\t>16
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
