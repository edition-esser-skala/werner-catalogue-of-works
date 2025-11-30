\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  c1^\partTc a4 f g a
  b c d c8[ b] a4 g a2
  g c c1
}

text = \lyricmode {
  San -- ctus, san -- _ _
  _ _ _ _ _ _ ctus,
  san -- _ ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4) }
}
