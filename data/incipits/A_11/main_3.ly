\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Barmherzigkheit" r8 a' d d f d
  b4 r8 \hA b b g \hA b a
  f f r a a a a b
}

text = \lyricmode {
  Nein nein ver -- za -- ge
  nicht, du würſt noch Gna -- de
  fün -- den, dan dei -- nes Vat -- ters
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
