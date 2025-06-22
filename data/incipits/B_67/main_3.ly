\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r2^\partSc a'
  a4 a a2
  a a
  a r
}

text = \lyricmode {
  Cre --
  do in u --
  num De --
  um,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
