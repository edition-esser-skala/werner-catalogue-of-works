\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro non molto"
  c'4.^\partSc c8 c g r c
  g e r g e c g' c
  h8. h16 h4 c8 r h r
}

text = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra pax ho --
  mi -- ni -- bus, pax, pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
