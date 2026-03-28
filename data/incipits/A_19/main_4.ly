\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Spirituoso"
  f8^\partVi a c c,
  f16( g32 a b c d e) f8 \gotoBar "14"
    \clef alto \autoBeamOff c,^\part "Debora"
  f a \tuplet 3/2 8 { c16[ d c] b[ a g] }
  f8. f16 f8 a
}

text = \lyricmode {
  \skips 6
  Es
  muß nicht ſtäts ein
  Don -- ner -- ſtein den
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
