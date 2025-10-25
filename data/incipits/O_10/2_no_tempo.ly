\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 12/16 \tempoMarkup "[no tempo]"
    d'16 f d b8. f16 b f d8.
    d'16 f d b d b f b f d8.
    b16 b b d d d f f f b8.
    d'\p e, f16 \hA e f f,8.
    c'' d, es16 d es es,8.
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 12/16 \tempoMarkup "[no tempo]"
    b'16 d b f8. d16 f d b8.
    b'16 d b f b f d f d b8.
    b16 b b d d d f f f b8.
    r2*3/4 c8.~\p c16 a c
    f, f f f8. b~ b16 g b
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 12/16 \tempoMarkup "[no tempo]"
    b'16 b b b b b b b b b b b
    b b b b b b b b b b f d
    b b b d d d f f f b b b
    b\p b b b b b a a a a a a
    as as as as as as g g g g g g
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <3>8. <4!> <6>4.
  <6 3>8. <4> <6>4.
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
