\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Spirituoso"
    e'8 a4 cis8
    gis16( a) h8 e,4
    e,8 h'4 d8
    cis16( d) e8 a,,4
    e''8 a4 cis8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Spirituoso"
    cis'8 a e' a
    h, gis4 a8
    h4 gis16( fis) gis8
    e cis'4 d8
    e16 d e8 cis8 e
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key a \major \time 2/4 \tempoMarkup "Spirituoso"
    a4 cis8 a
    e'4. fis8
    gis4 e
    a4. h8
    cis4 a
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
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
