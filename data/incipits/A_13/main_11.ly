\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  a'4.^\partSc a8 b4 b8 b
  a8. a16 a8 d b b g g
  e e r c' a a f f
}

text = \lyricmode {
  Ey laßt uns dan de --
  mü -- thig -- lich zu Got -- tes Füſ -- ſen
  fal -- len, zu Got -- tes Füſ -- ſen
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
