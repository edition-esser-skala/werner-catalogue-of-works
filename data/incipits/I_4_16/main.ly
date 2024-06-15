\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
  b'2.^\partSc a4 b c
  a f a b g f
  b4. c8 d4 c d e
  f2 r r
}

text = \lyricmode {
  Sal -- _ ve Re --
  gi -- na, ma -- _ ter mi --
  se -- _ ri -- _ cor -- di --
  ae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
