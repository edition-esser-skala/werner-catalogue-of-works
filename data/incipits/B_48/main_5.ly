\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key h \minor \time 3/4 \tempoMarkup "Larghetto"
  fis8.^\partVi gis32 ais h32( d16.) e32( g16.) fis32( d16.) e32( cis16.)
  \tuplet 3/2 8 { d16 cis h } d8~ \sbOn \tuplet 3/2 8 { d16 e fis g fis e } \sbOff \grace d8 cis4 \gotoBar "6"
  \clef soprano \autoBeamOff fis8^\partSs d4 h8 cis h16 ais
  h[ ais] h8 r h e16[ d] e8
}



text = \lyricmode {
  \skips 17
  Be -- _ ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
