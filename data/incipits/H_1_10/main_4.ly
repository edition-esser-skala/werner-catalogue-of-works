\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto moderato"
  a'2^\partSs h
  a4 d2 c4
  h e2 d4
  e2 r4 e
  a,4. h8 gis gis a4~
  a gis a r
}

text = \lyricmode {
  Lau -- da --
  te pu -- e --
  ri Do -- mi --
  num: Lau --
  da -- te no -- men Do --
  mi -- ni.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
