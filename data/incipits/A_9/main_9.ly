\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "St: Magdalena" c' c16 c e! c a8 a a16 g b a
  f8 r16 a d d f d c!8 g b16 b d c
  a4 r8 c a a a b
}

text = \lyricmode {
  Nun khe -- re, mei -- ne Seel, ge -- tröſt in dei -- nen
  Leib, der einſt be -- ruef -- fen war als ein ver -- kher -- tes
  Weib, al -- lein die Reu und
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
