\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
  r8 e'^\markup \remark "S coro" e e e8. e,16 e4
  e'8. e,16 e4 r2
  r8 e'4 e8 d e16 e c8 d
}

text = \lyricmode {
  Iam hy -- ems trans -- i -- it,
  trans -- i -- it,
  im -- ber ab -- i -- it et "re -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
