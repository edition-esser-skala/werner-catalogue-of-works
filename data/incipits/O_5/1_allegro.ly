\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
    e'8-! r a-! r
    e-! r cis-! r
    fis4.\trill e16 d
    a'8-! e-! r4
    d8(\p h) gis( e)
    d2~
    d8.\trill cis32( d) d8.\trill cis32( d)
    d8-! cis-! r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
    cis'8-! r cis-! r
    cis-! r a-! r
    d4.\trill cis16 h
    cis8-! cis-! r4
    d8(\p h) gis( e)
    d4 h~
    h8.\trill a32( h) h8.\trill a32( h)
    h8\trill a r4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
    a'8 a a a
    a a a a
    a a a a
    a a r4
    gis\p r
    gis8 gis gis gis
    gis gis gis gis
    a e cis a
  }
}

BassFigures = \figuremode {
  r2
  r
  <6 4>4 <\t \t>
  <5 3>2
  q
  <\t \t>
  <5 3>
  <4 2>8 <8 6>4.
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
