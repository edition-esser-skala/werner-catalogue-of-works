\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Gerechtigkheit" r8 g b b b d
  d a \clef soprano r8^\part "Barmherzigkheit" d' d a a c
  b4 r8 g \hA b b d \hA b
}

text = \lyricmode {
  So mueß ich gänz -- lich
  wei -- chen? Hier fün -- de -- ſtu nicht
  ſtatt, weill nichts als Lieb und
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
