\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Tempo ordinario"
  a''8.^\partVi g32 f e32 c16. d32 b16.
    \clef soprano \autoBeamOff c8.[^\partSs b32 a] g8 f
  f16[ e] e8 r c' c16[ f,] f8 r b
  b16[ e,] e8 r c' d16[ c d8]~ d16[ e f g]
}

text = \lyricmode {
  \skips #7 Be -- _ ne --
  di -- ctus, qui ve -- nit, qui
  ve -- nit in "no -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
