\version "2.24.2"
\include "header.ly"

Flauto = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    e'4. c16 h a( gis) a8 r a
    h \tuplet 3/2 8 { h16 c d } c( d) h8 \grace d16 c h a8 r c
    d \tuplet 3/2 8 { d16 e f } e( f) d8 e16( c) c( d) d( e) e( f)
    f( h,) h( c) c( d) d( e) e( a,) a( h) h( c) c( d)
    d( gis,) gis( a) a( h) h( c) c h a h32 c h8 e
    c e a4. gis16 fis? gis8.\trill a16
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1*4
    r2 e'4. c16 h
    a gis a8 r a h \tuplet 3/2 8 { h16 c d } c d h8
  }
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    a'8 c gis e f e16 d c8 a
    d h e e, a16 a' g! f e e d c
    f8 d g g, c a'16 g f8 e
    d g16 f e8 d c f16 e d8 c
    h e16 d c8 h a c gis e
    f16 f' e d c8 a d h e e,
  }
}

\score {
  <<
    \new Staff \with { \smallStaffDistance } {
      \set Staff.instrumentName = "fl"
      \Flauto
    }
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "vl 1"
        \ViolinoI
      }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Basso
      }
    >>
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
