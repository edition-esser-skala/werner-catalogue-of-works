\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d'2.^\partSs d4
  cis2 h4 fis
  g h8 d f f f4
}

text = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec -- ca -- ta "mun -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
