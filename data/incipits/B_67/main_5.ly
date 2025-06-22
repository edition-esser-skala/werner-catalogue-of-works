\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \phrygian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partTs e e,
  a h c
  c h8[ c] a4
  a8[ gis] gis4 r
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit, qui
  ve -- nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
