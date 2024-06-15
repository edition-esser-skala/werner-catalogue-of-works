\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  e2^\partSc a4 h
  c2 h4 h
  a d2 c4~
  c h2 a4~
  a gis a g8[ f]
  e2 d4 r
}

text = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _
  _ _
  _ _ _
  _ rum:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
