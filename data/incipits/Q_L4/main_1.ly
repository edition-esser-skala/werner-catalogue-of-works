\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "[no tempo]"
  \partial 8 g'8^\part "vl [?]" c c \tuplet 3/2 8 { e16 d c d[ c h] } c a' g8 g16 e f d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
