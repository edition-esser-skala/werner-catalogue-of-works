\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 12/8 \tempoMarkup "Spirituoso"
    cis'16( h cis d) cis8 e16( d e fis) e8 a4.~ a8 h cis
    d16( cis) h8 a gis16( fis) e8 d \grace d8 cis4. r4 r8
    r8 cis' e, r cis' e, r h' e, r h' e,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 12/8 \tempoMarkup "Spirituoso"
    cis'16( h cis d) cis8 e16( d e fis) e8 a,16 h cis8 d e4 a,8~
    a gis a h4. h8 a gis a16 gis a8 h
    cis e r cis e r h e r h e r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 12/8 \tempoMarkup "Spirituoso"
    a8 a' a gis, gis' gis fis e d cis4.
    h e a8 e cis a cis e
    a4. a, gis' gis,
  }
}

BassFigures = \figuremode {
  r4. <6> r q
  <7>8 <6> <7> <3 8>4 <_ 7>8 r2.
  r <6>
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
