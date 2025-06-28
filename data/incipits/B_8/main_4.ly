\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  h'4.^\partSc h8 cis4. dis16[ e]
  h8[ e,] e'2 d4
  cis8[ h] a2 g4
}

text = \lyricmode {
  San -- ctus, san -- _
  _ _ ctus,
  san -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
