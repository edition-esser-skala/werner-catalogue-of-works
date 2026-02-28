\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  e'4^\partSc r8 g g e r g
  g e r h c16[ d] e[ d] c8. c16
  h4 r8 d d h r d
}

text = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, in ter -- ra, ter -- ra
  pax, in ter -- ra, in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
