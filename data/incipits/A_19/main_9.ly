\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/8 \tempoMarkup "Vivace"
  a16^\partVi a' gis a c a
  h, a' gis a c a \gotoBar "23"
  \clef alto \autoBeamOff e8^\part "Debora" \tuplet 3/2 8 { a16[ h c] } h[ a]
  h4 r8
  e, \tuplet 3/2 8 { h'16[ c d] } c[ h]
  c4 e,8
}

text = \lyricmode {
  \skips 12
  Herr laß den
  Sieg,
  Herr laß den
  Sieg auf
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
