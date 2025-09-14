\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partBs e e
  fis h, h'8[ a]
  g[ fis] e d c!4
  h8 h a4. a8
  g4
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit in no --
  mi -- ne Do -- mi --
  ni,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
