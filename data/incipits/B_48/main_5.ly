\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key fis \minor \time 3/8 \autoBeamOff \tempoMarkup "Andante moderato"
  fis4.^\partBs
  gis
  a
  h4 gis8
  a8.[ cis16 fis, a] %5
}

text = \lyricmode {
  Be --
  ne --
  di --
  ctus, qui
  "ve -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
