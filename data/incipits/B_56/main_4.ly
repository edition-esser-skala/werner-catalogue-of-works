\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partSc c' d
  e2 e4
  d8[^\partSs f] e[ d] c[ h]
  c2 cis4
}

text = \lyricmode {
  San -- ctus,
  san -- ctus
  Do -- mi -- nus
  De -- us,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
