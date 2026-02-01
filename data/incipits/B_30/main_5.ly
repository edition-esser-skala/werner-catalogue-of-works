\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  e'4.^\partSs e8 e2
  e8.[ d32 c] h8 a \tuplet 3/2 8 { gis16[ a h] } e,8 r e
  c'4~ c16[ d, f a] h8.[\trill a32 h] c16[ d c d]
}

text = \lyricmode {
  Be -- ne -- di --
  ctus, __ _ qui ve -- nit in
  no -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
