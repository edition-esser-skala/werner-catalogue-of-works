\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    cis'8( d) e( fis) e( dis)
    e4 e, e
    cis''8( a) gis( fis) e( dis)
    \grace dis e2 r4
    h'8( g) fis( e) d( cis)
    \grace cis d2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    cis'8( d) e( fis) e( dis)
    e4 e, e
    cis''8( a) gis( fis) e( dis)
    \grace dis e2 r4
    h'8( g) fis( e) d( cis)
    \grace cis d2 r4
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "[no tempo]"
    a'2 4
    gis gis gis
    a2 r4
    gis gis gis
    g2 r4
    fis fis fis
  }
}

BassFigures = \figuremode {
  r2.
  <6>
  r
  q
  <5 3>
  <6>
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
