\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
  r4^\partSs r e'~
  e d c~
  c b a
  gis2 a4
  h!2 a4~
  a gis r
}

text = \lyricmode {
  Ky --
  ri -- e __
  e -- _
  lei -- son,
  e -- lei --
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
