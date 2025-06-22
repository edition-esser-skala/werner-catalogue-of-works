\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  r4 c'^\partSc c c c4. c8
  c2 a4 d cis2
  r4 d d d h h
}

text = \lyricmode {
  Lau -- da -- te pu -- e --
  ri Do -- mi -- num,
  lau -- da -- te no -- men
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
