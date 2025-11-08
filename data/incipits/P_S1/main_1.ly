\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Andante"
  g''8.^\partVi d16 d16. b32 b16. g32 g8. d16 d16. b32 b16. g32
  g8 b'' \tuplet 3/2 8 { d16 c b c[ b a] } b8 b, \tuplet 3/2 8 { d16 c b c[ b a] }
  b8. h16 h8. c16 c8. cis16 cis8. d16
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
