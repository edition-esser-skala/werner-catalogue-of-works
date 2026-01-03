\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Lucifer" b es16 es \hA b g c8 c c16 c g as
  b8 b16 b b des c g as4 r16 \hA as as c
  es8. as,16 as8 as c c es des
}

text = \lyricmode {
  Steh auf, du Höl -- len -- braud! du ſol -- leſt nun er --
  ſchei -- nen vor Gött -- li -- chen Ge -- richt, zu dei -- ner
  größ -- ten Schand wir -- ſtu mit al -- len
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
