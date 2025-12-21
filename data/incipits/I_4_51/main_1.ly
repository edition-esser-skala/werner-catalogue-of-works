\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  a'1^\partAc d,2
  r4 f g a b2
  a r4 a g2
  f e f
}

text = \lyricmode {
  Sal -- ve,
  sal -- ve Re -- gi --
  na, Re -- gi --
  na, sal -- ve,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
