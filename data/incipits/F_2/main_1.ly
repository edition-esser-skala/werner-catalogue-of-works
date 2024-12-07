\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \mixolydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  d1^\partTc c2 a
  h c d2. d4
  g,2 a h a4 g
}

text = \lyricmode {
  Ex -- ul -- tet
  coe -- lum lau -- di --
  bus, re -- sul -- tet _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
