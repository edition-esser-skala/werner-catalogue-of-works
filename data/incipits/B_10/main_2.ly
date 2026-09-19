\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    \once \override Staff.TimeSignature.style = #'single-digit
  d'4^\partSc r8 d d cis
  d4 r8 d d cis
  d4 d4. cis8
  h8. h16 h8 h4 h8
}

text = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho --
  mi -- ni -- bus bo -- nae
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
