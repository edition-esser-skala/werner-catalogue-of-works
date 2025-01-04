\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
  r8^\partSc c' c d e8. e16 e4
  e8 e16 e g8 e16 e d8. d16 d4
  r8 d e e e8. e16 e4
}

text = \lyricmode {
  Plau -- den -- tes vir -- gi -- ni,
  pro -- di -- te, pro -- di -- te po -- pu -- li,
  psa -- len -- tes can -- ti -- bus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
