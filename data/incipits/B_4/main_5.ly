\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  f,4^\partTs g f8 b4 a8
  g c4 h8 c4 r
  r2 r8 e d8. d16
  cis8 d4 c b!16 c a8. a16
}

text = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- _ _ nit
  in no -- mi --
  ne Do -- _ mi -- ni, no -- "mi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
