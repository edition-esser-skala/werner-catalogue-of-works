\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagoi"
  c'2.^\partSc c4
  c2 h
  c4 r r e
  e8[ d] d4 r fis
}

text = \lyricmode {
  A -- gnus
  De -- _
  i, qui
  tol -- lis, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
