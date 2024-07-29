\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "[no tempo]"
  h'4~^\partUnk h16( c h a) h8. c16 d( c) c( h)
  e( d) d( c)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
