\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/8 \tempoMarkup "Tempo di menuet"
    \once \override TextScript.X-offset = #-2
  b'8^\partVi c8.\trill b32 c
  d8 es r
  f g g,16 c
  a8 b r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
