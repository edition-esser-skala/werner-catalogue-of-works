\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro"
  b'16^\partVi c d es f8 f,
  b16 b' a b b, b' a b \gotoBar "19"
  \clef soprano \autoBeamOff b,16[^\part "Barmherzigkheit" c d es] f8 f,
  b4 r8 g'
  f16[ es d8] es16[ d c8]
}

text = \lyricmode {
  \skips #14
  Wie __ _ der
  Hierſch zur
  Brun -- "nen -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
