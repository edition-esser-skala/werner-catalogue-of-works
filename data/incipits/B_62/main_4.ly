\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  d'1~^\partSc
  d4 c2 h4
  a2. g4
  g fis g2
}

text = \lyricmode {
    San --
  _ _
  _ ctus,
  san -- _ ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
