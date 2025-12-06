\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "[no tempo]"
  \tuplet 3/2 4 { f'8^\partVi g a } f,2
  \tuplet 3/2 4 { a'8 b c } f,,2
  b'16( d8.) c16( g8.) a16( f8.)
  \tuplet 3/2 4 { e8 f g } c,4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
