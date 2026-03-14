\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
  r4^\partSc r8 g' c g e' c
  g'4 g,8 h c d e8. e16
  d8 d e4. cis8 d4~
}

text = \lyricmode {
  Re -- gi -- na sal -- ve,
  ma -- ter mi -- se -- ri -- cor -- di --
  ae, vi -- ta, dul -- "ce -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
