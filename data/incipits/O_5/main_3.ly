\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 4/4 \tempoMarkup "Tempo ordinario"
  \partial 16 a''16(^\partVi e2) \grace fis8 e2
    \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 \grace e8 d16 cis32 e, a cis e[ a, cis e] a8 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
