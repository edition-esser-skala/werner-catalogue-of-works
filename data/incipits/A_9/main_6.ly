\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Judex" r8 f b b d \hA b
  g g r g g g h g
  e8. e16 e8 gis h e, d e
}

text = \lyricmode {
  Auf auf ihr Him -- mels
  Gei -- ſter! Be -- ge -- bet euch nun
  all -- zu -- gleich in al -- le Theil der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
