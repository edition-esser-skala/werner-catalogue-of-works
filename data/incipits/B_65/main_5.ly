\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partAs f4. f8
  g4 g8[ f] g[ as]
  f4 f r \gotoBar "16"
  \time 4/4 \partial 4 a,4^\partAc d cis f e
  a g f f
  e2 d
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit
  O -- san -- na in ex --
  cel -- sis, in ex --
  cel -- sis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/4) }
}
