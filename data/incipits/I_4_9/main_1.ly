\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
  e'2^\partSs a,4
  e' d c
  b a8[ gis] a4
  d c h
  a2 h4
}

text = \lyricmode {
  Sal -- ve
  Re -- gi -- na,
  sal -- _ ve
  ma -- ter mi --
  se -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
