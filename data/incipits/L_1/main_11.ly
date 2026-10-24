\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Sagfäller" r8 d f f f a
  a8. e16 e8 a fis8. fis16 a8 b
}

text = \lyricmode {
  Hiez hab i oä -- nen
  Vor -- thl glehrnt der koſt mi zwey Maß
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
