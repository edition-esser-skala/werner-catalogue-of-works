\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  g'4^\partBc d h g8 h
  c4 a g r
  \clef soprano r2^\partSc h''4 a
  h8 a16 h c8 h16([ a)] h4 r
}

text = \lyricmode {
  Et in ter -- ra, in
  ter -- ra pax,
  Et in
  ter -- ra, in ter -- ra pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
