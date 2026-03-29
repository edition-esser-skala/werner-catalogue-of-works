\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \dorian \time 4/4 \tempoMarkup "[unknown]" \autoBeamOff
  g'4.^\partAs g8 g[ f] f g
  as4 as8 as g8. \hA as32 g f8. es16
  es4 r r2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
