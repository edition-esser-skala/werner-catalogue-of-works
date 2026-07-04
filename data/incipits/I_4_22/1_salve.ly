\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r4-\solo a''2~\p
    a4 fis e8 d
    cis( h) cis( a) d( a)
    e'4 fis gis,
    a8( gis) a4 h
    cis8( e) d( cis) h( a)
    gis4 e'8( fis) \tuplet 3/2 { gis( fis e) }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    r4-\solo a''2~\p
    a4 fis e8 d
    cis( h) cis( a) d( a)
    e'4 fis gis,
    a8( gis) a4 h
    cis8( e) d( cis) h( a)
    gis4 e'8( fis) \tuplet 3/2 { gis( fis e) }
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    cis'8[^\solo d] e4 h
    a8[ gis] a4 r
    e' d cis8[ h]
    cis[ h] cis4 r
    e fis e
    dis d2
    cis8[ e] d[ cis] h[ a]
    gis[ a] h4 r
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _ ve,
  sal -- ve,
  Re -- gi -- na
  sal -- ve,
  ma -- ter mi --
  se -- ri --
  cor -- di -- ae,
  sal -- ve,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    a4-\solo a' gis
    fis e d
    cis d e
    a a, h
    cis d e
    fis2 gis4
    a fis d
    e2 d4
  }
}

BassFigures = \figuremode {
  r2.
  <\t>
  r2 <6 4>8 <5 _+>
  r2.
  r
  <6\\>4 <6!> <5>
  r <6> q
  r2.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
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
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
