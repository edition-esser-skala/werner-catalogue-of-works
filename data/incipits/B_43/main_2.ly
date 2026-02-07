\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
    \once \override Staff.TimeSignature.style = #'single-digit
  d4^\partBs r8 d' f, a
  d,4 r r8 e
  f4*1/2 \clef soprano f''8^\partSc a, c f, r
}

text = \lyricmode {
  Et in ter -- ra
  pax, pax,
  pax, in ter -- ra pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
