\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  a2.^\partTs a4
  b2 \clef soprano c'^\partSs
  c4 c8 c c4 c
  d2 c8 c4 c8
}

text = \lyricmode {
  A -- gnus
  De -- qui
  tol -- lis pec -- ca -- ta
  mun -- di: Mi -- "se -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
