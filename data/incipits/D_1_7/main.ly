\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
  d'4.^\partSc c8 b d
  c4 r r
  d4. c8 b d
  c4 c r
}

text = \lyricmode {
  To -- ta pul -- chra
  es,
  pul -- chra es, Ma --
  ri -- a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
