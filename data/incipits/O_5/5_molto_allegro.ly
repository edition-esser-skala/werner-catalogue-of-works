\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/8 \tempoMarkup "Molto allegro"
    a'16( cis8.) h16( d8.)
    cis16( e8.) r8 e,
    a gis16 fis e8 d
    d( cis) r e\p
    a gis16 fis e8 d
    d( cis) r fis'\f
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/8 \tempoMarkup "Molto allegro"
    a'16( cis8.) h16( d8.)
    cis16( e8.) r8 e,
    a gis16 fis e8 d
    d( cis) r e\p
    a gis16 fis e8 d
    d( cis) r fis'\f
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key a \major \time 4/8 \tempoMarkup "Molto allegro"
    a'4 gis
    a e16( gis8.)
    fis16( a8.) gis16( h8.)
    a16( cis8.) e,16(\p gis8.)
    fis16( a8.) gis16( h8.)
    a16( cis8.) h16( d8.)
  }
}

BassFigures = \figuremode {
  r4 <6>8 <5>
  r4 r16 <6>8.
  r16 q4 q8.
  <4>16 <3>4 <6>8.
  r16 q8. q16 <3>8.
  <4>16 <3>4..
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
