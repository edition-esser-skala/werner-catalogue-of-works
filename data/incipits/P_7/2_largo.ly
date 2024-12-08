\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key fis \minor \time 3/4 \tempoMarkup "Largo"
    cis'4 d e
    fis2 e4
    dis2.
    e
    d!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key fis \minor \time 3/4 \tempoMarkup "Largo"
    a'2 g4
    a2.~
    a4 h a
    gis!2 ais4
    h2.
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key fis \minor \time 3/4 \tempoMarkup "Largo"
    fis2 e4
    d d' c
    h2.
    e,4 cis2
    h4 g' fis
  }
}

BassFigures = \figuremode {
  <5>4 <6> <6 _!>
  r2 r4
  <7 _+>2.
  <_+>4 <5> <6\\>
  r <5 3> <6 4>
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
