\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
      \once \override Staff.TimeSignature.style = #'single-digit
    c'8.-\tutti e32 d c8 g e g
    c,4 r r
    c'8. e32 d c8 g e g
    c,4 r r
    c e a %5
    d, g g,
    c f f,
    h e e,
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2.
  r2 q4
  r2.
  r %5
  <7>4 q2
  q4 q2
  q4 q2
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
