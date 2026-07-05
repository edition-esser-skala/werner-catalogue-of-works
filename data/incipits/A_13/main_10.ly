\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schöpffer" d, fis a d, \hA fis a16 c b a
  b8 b \clef tenor r d^\part "Gerechtigkeit" d8. g,16 g8 g
  cis8. cis16 e8 g, a a16 \fC a^\part "Adam" a a d a
}

text = \lyricmode {
  Woll -- an! der Streut muß nun ſein End ge --
  win -- nen. Barm -- her -- zig -- keit gleich
  pack -- he dich von hin -- nen! So iſt dan gar kein
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
