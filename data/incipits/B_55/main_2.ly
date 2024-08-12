\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  d'2^\partSc d
  d d,8 d' cis h
  a g fis e d4 a'8 a
}

text = \lyricmode {
  Et in
  ter -- ra, in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
