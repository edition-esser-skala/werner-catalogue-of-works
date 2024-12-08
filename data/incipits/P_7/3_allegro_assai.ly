\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8 \tempoMarkup "Allegro assai"
    a'8 cis e
    h e, e'~
    e d h
    cis a'4~
    a8 gis e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/8 \tempoMarkup "Allegro assai"
    cis8 a16 h cis d
    e4 gis8
    a4 h8~
    h a16 h cis8
    d4 e8
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 3/8 \tempoMarkup "Allegro assai"
    a8 a'4~
    a8 gis e
    fis4 gis8
    a cis a
    h4 cis8
  }
}

BassFigures = \figuremode {
  r4.
  <5 2>8 <\t \t>4
  <7>8 <6>4
  <9>8 <6>4
  <7>8 <6>4
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
