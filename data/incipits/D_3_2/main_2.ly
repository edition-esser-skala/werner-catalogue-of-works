\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  h'1^\partSc h2 h
  h1 h2 cis
  d1 g,2 g
  c! c h h
}

text = \lyricmode {
  Tri -- stis est
  a -- ni -- ma
  me -- a us --
  que ad mor -- tem,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
