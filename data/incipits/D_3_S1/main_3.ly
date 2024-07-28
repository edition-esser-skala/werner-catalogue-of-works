\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
    \key b \major \time 3/4 \tempoMarkup "Un poco allegro" \autoBeamOff
  b'2^\partSc b4
  c2 c4
  d2 d4
  f2 es4\trill
  d2 r4
}

text = \lyricmode {
  Ho -- mo
  qui -- dam
  fe -- cit
  coe -- _
  nam,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
