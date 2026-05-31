\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Larghetto"
  d''8.^\partVi c32 b a16 e cis a \tuplet 3/2 8 { f e f } d8 f'8.\trill e32 d \gotoBar "4"
  \clef soprano \autoBeamOff
    d8.[^\partSs c32 b] a8. g16 f[ e] d8 r f'16[ a,]
  b[ a] b8 r c16[ g] a[ g] a b c4
}

text = \lyricmode {
  \skips 14
  Be -- _ ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit in "no -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
