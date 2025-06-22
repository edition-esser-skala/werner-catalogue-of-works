\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  d4.^\partTc d8 a4 a
  \clef soprano d'4.^\partSc d8 a4 a
  d,2 r
  a' h4. cis8
}

text = \lyricmode {
  Et in ter -- ra
  Et in ter -- ra
  pax
  ho -- mi -- "ni -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
