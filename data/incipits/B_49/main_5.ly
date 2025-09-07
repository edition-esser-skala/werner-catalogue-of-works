\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  f2.^\partAs
  e
  f
  c2 c4
  cis4. cis8 cis4
}



text = \lyricmode {
  Be --
  ne --
  di --
  ctus, qui
  ve -- nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
