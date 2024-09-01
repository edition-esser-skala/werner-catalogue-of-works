\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  a'4.^\partBs e8 c'4 a
  r a d d,
  r d b' h8 h
}

text = \lyricmode {
  A -- gnus De -- i,
  qui tol -- lis,
  qui tol -- lis "pec -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
