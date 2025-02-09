\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  a'4^\partSc d4. cis16[ h] cis4
  d8 a4 h8 cis2~
  cis8[ d16 cis] h4. cis16[ h] a4~
}

text = \lyricmode {
  San -- _ _ _
  ctus, san -- _ _
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
