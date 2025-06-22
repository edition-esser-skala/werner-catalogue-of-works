\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    h'16.\trill a64( h) d16.[\trill c64( d)] g16.\trill fis64( g) h16.[\trill a64( h)] c2
    h a
    g fis16. fis32 fis16. fis32 fis16. fis32 fis16. fis32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g'16.\trill fis64( g) h16.[\trill a64( h)] d16.\trill c64( d) g16.[\trill fis64( g)] a2~
    a4 g2 fis4~
    fis e e16. e32 e16. e32 e16. e32 e16. e32
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g'16. g32 g16. g32 g16. g32 g16. g32 fis fis fis fis fis fis fis fis fis fis fis fis fis fis fis fis
    g g g g g g g g e e e e e e e e cis cis cis cis cis cis cis cis dis dis dis dis dis dis dis dis
    e e e e e e e e c c c c c c c c ais ais ais ais ais ais ais ais ais ais ais ais ais ais ais ais
  }
}

BassFigures = \figuremode {
  r2 <5! 3>4 <\t \t>
  <10 9> <5 3> <6 5> <5 3>
  <10 9> <5 3> <6 5> <\t \t>
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
