\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    \once \override Staff.TimeSignature.style = #'single-digit
  e'4^\partSc r8 e g e
  d4 r8 d g d
  e r g r e r
  c r f4 d
}

text = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax, pax,
  pax, pax "ho -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
