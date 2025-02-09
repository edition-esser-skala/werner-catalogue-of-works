\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    a''4. g16( fis) e4
    \tuplet 3/2 4 { fis8 e d } \grace d cis2
    d4. cis16( h) a8 g
    \tuplet 3/2 4 { fis e d } \grace d cis2
    d4. e16 fis e4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    a''4. g16( fis) e4
    \tuplet 3/2 4 { fis8 e d } \grace d cis2
    d4. cis16( h) a8 g
    \tuplet 3/2 4 { fis e d } \grace d cis2
    d4. e16 fis e4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    d4 fis cis
    d a' g
    fis d' cis
    d a g
    fis d cis
  }
}

BassFigures = \figuremode {
  r4 <6> q
  r <3> <\t>
  <6>2 q8 <5>
  r4 <3> <\t>
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
}
