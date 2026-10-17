\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Largo"
  b''8^\partVi f16 es \sbOn \tuplet 3/2 8 { d es f es d c d c b } b8 \gotoBar "6"
    \clef alto \autoBeamOff r8^\partAs f
  b f f16[ c] d[ es] d8 d16[ es] f8 b
  g16[ a] b[ f] \appoggiatura f8 es4\trill d8 b f' g16[ a]
}

text = \lyricmode {
  \skips 13
  Laſt
  ab von eu -- ren Trau -- ren ihr ge --
  kränck -- te Her -- zen, wie lang, wie
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
