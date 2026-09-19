\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  a8^\partBs e c' a, f'4 r
  h8 g d' g,, e'4 r
  \clef soprano c''8^\partSc c c8. c16 h8 r cis r
}

text = \lyricmode {
  Et in ter -- ra pax,
  et in ter -- ra pax,
  pax ho -- mi -- ni -- bus, pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
