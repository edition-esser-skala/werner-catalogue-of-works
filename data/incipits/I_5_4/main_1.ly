\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
  a'8^\partSs d a g f8.\trill e16 d4
  r2 r8 f' \tuplet 3/2 8 { e16[ d c!] d[ c b] }
  c8 r r4 c8 b16[ a] d64[ c b16.] a64[ g f16.]
}

text = \lyricmode {
  Sub tu -- um prae -- si -- di -- um
  con -- fu -- gi --
  mus, San -- cta De -- i
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
