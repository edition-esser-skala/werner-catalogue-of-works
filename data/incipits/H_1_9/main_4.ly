\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  c'2^\partSc c4 c,8 c'
  c4 c, r8 c' c c
  h4 c8 d e4. e8
  d e d c h[ e] d[ c]
}

text = \lyricmode {
  Lau -- da -- te, lau --
  da -- te, lau -- da -- te
  pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
