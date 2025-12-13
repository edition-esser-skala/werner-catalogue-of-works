\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  g1^\partTc a2. a4
  h2 c1 h2
  c a g fis
}

text = \lyricmode {
  E -- gre -- gi --
  e do -- ctor
  Pau -- _ le, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
