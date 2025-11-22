\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    e'2.
    c'4 f,( e)
    h' e,( dis)
    \grace dis8 e2 r4
    a,8 b' a4 g!
    \grace g8 f2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    e'2.
    c'4 f,( e)
    h' e,( dis)
    \grace dis8 e2 r4
    a,8 b' a4 g!
    \grace g8 f2 r4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    a'8 h c4 h
    r a( gis)
    r g( f)
    r e d
    cis2 r4
    d8 a' d4 c!
  }
}

BassFigures = \figuremode {
  r4 <6> <\t>
  r <6> q
  r q <6\\>
  r <_+>2
  <6> <5>4
  <_!>2.
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
