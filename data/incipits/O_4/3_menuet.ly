\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    a'4. h16 cis d4
    h \grace a8 g2
    fis4 a2
    g fis4
    e a8 g fis4
    d'8( h) \tuplet 3/2 4 { gis a h a h cis }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    a'4. h16 cis d4
    h \grace a8 g2
    fis4 a2
    g fis4
    e a8 g fis4
    d'8( h) \tuplet 3/2 4 { gis a h a h cis }
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \major \time 3/4 \tempoMarkup "[no tempo]"
    d4 e fis
    d e cis
    d fis8 e d4
    e cis d
    a8 h cis4 d
    h e cis
  }
}

BassFigures = \figuremode {
  r2 <6>4
  q <_!> <\t>
  r <6>2
  <3>4 <5>2
  r4 <6>8 <5>4.
  r4 <_+> <6>
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
