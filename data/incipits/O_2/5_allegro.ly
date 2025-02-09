\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/8 \tempoMarkup "Allegro"
    \afterGrace d'2 { d16( cis h) }
    \afterGrace a2 { g16( fis e) }
    d16 e fis d a8 g'
    fis d r4
    d16\p e fis d a8 g'
    fis d r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/8 \tempoMarkup "Allegro"
    \afterGrace d'2 { d16( cis h) }
    \afterGrace a2 { g16( fis e) }
    d16 e fis d a8 g'
    fis d r4
    d16\p e fis d a8 g'
    fis d r4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 4/8 \tempoMarkup "Allegro"
    d8[ d d d]
    d[ d d d]
    d16 e fis d a'8 a,
    d fis16 a d8 a16 fis
    d\p e fis d a'8 a,
    d fis16 a d8 a16 fis
  }
}

BassFigures = \figuremode {
  r2
  r
  r4 <8>8 <7>
  r <6>4.
  r <7>8
  r <6>4.
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
