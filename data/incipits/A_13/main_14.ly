\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schöpffer" f, f16 f b f d8. d16 d8 f
  as8. as16 as8 g e! e16 e g g g a
  b8. b16 b8 g e e g f
}

text = \lyricmode {
  Weil dan mein ein -- ge -- bohr -- ner Sohn daß
  menſch -- li -- che Ver -- bre -- chen an ih -- me ſelbſt frey --
  wil -- lig -- lich auß Lieb will laſ -- ſen
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
