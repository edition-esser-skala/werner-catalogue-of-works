\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Larghetto"
    fis8.\f gis32 ais h32( d16.) e32( g16.) fis32( d16.) e32( cis16.)
    \tuplet 3/2 8 { d16 cis h } d8~ \sbOn \tuplet 3/2 8 { d16 e fis g fis e } \sbOff \grace d8 cis4 \gotoBar "6"
    h,4 r r
    r8 fis''\p h16( a!) h8 r e,
    a16( g) a8 r4 r
    r8 a16(\f e) e( fis) fis8 r g16( d)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key h \minor \time 3/4 \tempoMarkup "Larghetto"
    fis16(\f d) d( h) d32( fis16.) g32( e'16.) d32( h16.) cis32( ais16.)
    h8 h, r g' \sbOn \tuplet 3/2 8 { g16 a h cis h a } \sbOff \gotoBar "6"
    h,4 r r
    r8 d'\p h g' r cis,
    a fis' r4 r
    r r8 d16(\f a) a( h) h8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key h \minor \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
    R2.*2 \gotoBar "6"
    fis'8^\solo d4 h8 cis h16 ais
    h[ ais] h8 r h e16[ d] e8
    r a, a h16 cis d8 h16 g
    \grace fis8 e8.\trill d16 d4 r
  }
}

SopranoLyrics = \lyricmode {
  Be -- _ ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit,
  qui ve -- nit in no -- mi -- ne
  Do -- mi -- ni,
}

Alto = {
  \relative c' {
    \clef alto
    \key h \minor \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
    R2.*2 \gotoBar "6"
    r8 h4^\solo g'8 g fis16 e
    d[ cis] d8 r e cis16[ h] cis8
    r fis e d16 e a, d8 e16
    d8[ cis16.]\trill d32 d4 r
  }
}

AltoLyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit,
  qui ve -- nit in no -- mi -- ne
  Do -- mi -- ni,
}

Organo = {
  \relative c {
    \clef bass
    \key h \minor \time 3/4 \tempoMarkup "Larghetto"
    h'8-\solo h, r e fis4
    h, r8 e a! a, \gotoBar "6"
    h4 g' e8 fis
    h, h' g e cis a'!
    fis d cis a fis g
    a4 d8 d, g g'
  }
}

BassFigures = \figuremode {
  r2 <6 4>8 <5 _+>
  r2.
  r2 <6>4
  r2.
  r2 <6>8 <6 5>
  <6 4> <5 3> r2
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

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics
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
