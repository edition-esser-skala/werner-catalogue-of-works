\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  d'4.^\partSc c8~ c[ b16 a] b4
  a2 r8 es'!4 d8~
  d[ c16 h] c8[ fis,] g g h d
}

text = \lyricmode {
  Sal -- _ _
  ve, sal -- _
  _ ve ma -- ter "mi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
