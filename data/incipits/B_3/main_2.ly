\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'4.^\partSc d8 d4 d,
  r d' d d,
  r d' e, e
  r e' fis, fis
}

text = \lyricmode {
  Et in ter -- ra,
  in ter -- ra,
  in ter -- ra,
  in ter -- ra
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
