\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Barmherzigkheit" r8 b' b b g \hA b
  b f r4 \hA b8 b c d
  es es r \hA es b c des c
}

text = \lyricmode {
  Nun -- mehr iſts ſchon ge --
  ſchloſ -- ſen, daß der Sün -- der
  le -- be, ſein Hertz zu Gott "er -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
