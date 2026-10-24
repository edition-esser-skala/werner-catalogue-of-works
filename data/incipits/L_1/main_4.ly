\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Savoiard" r8 g b8. b16 b8 d
  d8. a16 a8 a h8. h16 d8 es
  c4
}

text = \lyricmode {
  Ick gom auß die Sa --
  vo -- ier Länd mit ſö -- ner Ra -- ri --
  tè
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
