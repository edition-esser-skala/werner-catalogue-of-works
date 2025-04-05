\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 2/4 \tempoMarkup "Allegro"
  d'4^\partVi fis
  a r16 a h cis
  d8 d4 d8 d d4 d8
  cis32 h a8. h8 h
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
