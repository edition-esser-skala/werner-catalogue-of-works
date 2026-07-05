\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Adam" r8 e, a a c e
  gis, gis r h d d f e
  c c c e c g b c
}

text = \lyricmode {
  Ô mich boß -- haff -- ten
  Men -- ſchen! was hab ich doch ge --
  dacht? daß ich mein Gott und ſein "Ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
