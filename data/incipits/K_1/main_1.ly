\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  f4^\partAs g a4. a8
  a2 a4 a
  a a a a8 a
}

text = \lyricmode {
  In -- _ _ ci --
  pit la -- men --
  ta -- ti -- o Ie -- "re -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
