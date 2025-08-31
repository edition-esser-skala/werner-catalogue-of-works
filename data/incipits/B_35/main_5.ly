\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "Molto largo"
  a'16(^\partV c') c64( h32.) h64( a32.) gis16( f!) f64( e32.) e64( d32.) \sbOff \tuplet 3/2 8 { c16 h a } a8 c'4 \gotoBar "6"
  \clef soprano \autoBeamOff
  a,8.[^\partSs h16] \tuplet 3/2 8 { c[ d e] e[ fis gis] } a8 a, r c
  h16[ dis,] e8 r dis' dis16[ e] e,8 r h'
}

text = \lyricmode {
  \skips 12
  Be -- _ ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
