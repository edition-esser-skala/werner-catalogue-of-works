\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  r8 d'^\partSs f e d4 d8 c
  b4 a r8 g4 f8
  b8. b16 a4 r8 g4 f8
}

text = \lyricmode {
  A -- ve Re -- gi -- na coe --
  lo -- rum, a -- ve
  Do -- mi -- na An -- "ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
