\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r8^\partSs g'[ c] e f[ d] h f
  f[ e] e a gis[ h] d e
  f4. e16[ d] c2\trill
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta "mun -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
