\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  c1^\markup \remark "t-trb"
  \clef alto r8^\part "St: Michael" c g'16 g g as f8 f16 f f f as g
  es8 es \clef tenor r^\part "St: Petrus" c a c es d
}

text = \lyricmode {
  \skips 1
  Woll -- an, die Zeit bricht an, ihr ſolt vor Ge -- rich -- te
  ge -- hen. Ô ü -- ber -- bitt -- re
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
