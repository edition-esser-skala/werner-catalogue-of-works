\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Largo"
    R2.*3
    h''2.~
    h4 ais fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/4 \tempoMarkup "Largo"
    e'2.~
    e4 dis h
    c2.
    h4 fis' g
    d cis dis
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/4 \tempoMarkup "Largo"
    e8 fis g4 e
    fis h gis
    a e fis
    g! d e
    fis2 h,4
  }
}

BassFigures = \figuremode {
  r2.
  <7>4 <_+> <6>
  r <6>2
  r4 <6> <\t>
  <6 4> <5+ _+> <_+>
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
