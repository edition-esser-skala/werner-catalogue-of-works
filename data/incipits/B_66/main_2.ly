\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "Adagio"
  d'2^\partSc r4 d d d
  d2 r4 d d d
  d2 r f
  r4 f f f f2
}

text = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, et
  in ter -- ra pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
