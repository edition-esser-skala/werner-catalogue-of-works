\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  e2^\partTs a, r4 d
  c d h2 a
  r4 gis a h c8[ d] e4
}

text = \lyricmode {
  Sal -- ve, sal --
  ve Re -- gi -- na,
  ma -- ter mi -- se -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
