\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "[no tempo]"
  d'8^\partVii c16 d e8 e e fis, d'16 c c8 \gotoBar "8"
  \clef soprano \autoBeamOff g4^\partSc g e' d8 c
  h[ a] h d e4 d8[ e]
  c2 h
}

text = \lyricmode {
  \skips 10
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
