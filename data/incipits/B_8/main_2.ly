\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  h'8^\partAs gis dis e fis gis16[ h] a8. a16
  gis8 r r4 r r8 \clef soprano cis^\partSs
  a16([ h cis a] d8.) d16 cis8 r r4
}

text = \lyricmode {
  Et in ter -- ra pax ho -- mi -- ni --
  bus lau --
  da -- mus te,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
