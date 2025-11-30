\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/4 \tempoMarkup "Allegro"
    \once \override Staff.TimeSignature.style = #'single-digit
  c'8.^\partOrg e32 d c8 g e g
  c,4 r r
  c'8. e32 d c8 g e g
  c,4 r r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
