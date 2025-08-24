\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Allegro"
    \once \override TextScript.X-offset = #-4
  b'16\trill^\partVi a b8 r4 b16\trill a b8 r4
  c16 es g8 f es d16 b f' d b'8 d,
  c16 es g8 f es d b16 d f8 b
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
