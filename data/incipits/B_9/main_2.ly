\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro passato"
  e'4.^\partSc e8 e4 e,
  r r8 e' e4 e,
  r8 cis' d e fis8. e16 d4
}

text = \lyricmode {
  Et in ter -- ra,
  in ter -- ra
  pax, pax ho -- mi -- ni -- bus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
