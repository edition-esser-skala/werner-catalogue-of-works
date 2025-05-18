\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
    \once \override Staff.TimeSignature.style = #'single-digit
  d'4^\partSc r8 cis d cis
  d4 r8 e d8. d16
  cis8 cis[ d] e fis e
}

text = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae vo -- "lun -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
