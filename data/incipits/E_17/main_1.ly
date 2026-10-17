\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Andante"
  c'8.^\partVi d32 e f8 c
  d16( b) f'( d) b'8 \gotoBar "12"
    \clef soprano \autoBeamOff c,^\partSs
  d16[ b] d8 f d
  c4 r8 c
  b16[ a] b8 g' b,
}

text = \lyricmode {
  \skips 8
  Heüt
  tratt der Ja -- cobs
  Stern ins
  ſchö -- ne Him -- "mels -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
