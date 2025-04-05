\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Prestissimo"
    \grace { d'16 cis } d4 \grace { a16 g } a4 \grace { fis16 e } fis4 d
    \grace { d'16 cis } d4 \grace { h16 a } h4 \grace { g16 fis } g4 d
    \grace { e'16 d } e4 \grace { cis16 h } cis4 \grace { a16 g } a4 a,8 g'
    g4 fis r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Prestissimo"
    \grace s8 r4 \grace { fis16 e } fis4 \grace { a16 g } a4 fis
    r \grace { g16 fis } g4 \grace { h16 a } h4 d
    r e,8( a) cis( a) e'( e,)
    e4\trill d r2
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Prestissimo"
    \grace s8 d16( fis) d( fis) d( fis) d( fis) d( fis) d( fis) d( fis) d( fis)
    d( g) d( g) d( g) d( g) d( g) d( g) d( g) d( g)
    cis,( e) cis( e) cis( e) cis( e) cis( e) cis( e) cis( e) cis( e)
    d( fis) d( fis) d( fis) d( fis) d( fis) d( fis) d( fis) d( fis)
  }
}

BassFigures = \figuremode {
  r1
  <6 4>
  <6>2. q8 <5>
  <4 2>4 <3 1>2.
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
