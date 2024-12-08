\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/2 \tempoMarkup "Largo"
  e'1^\partVi d2
  c4( e) g2 r
  a,\p g4( e) f( d)
  e( d) e2 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
