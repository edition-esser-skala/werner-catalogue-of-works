\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Larghetto"
  \grace { f'16[ g] } a2^\partVi a16 gis e4.
  \grace { e,16 f } g!2 g16 f d4.
  a''8.\trill b32 c d16 d, c'8 \grace c b4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
