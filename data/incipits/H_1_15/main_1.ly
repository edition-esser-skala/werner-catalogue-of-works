\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  e'4^\partSc g c,8 d16 e d8 d16 d
  e8 e r c4 a8 r h~
  h g r a4 f8 r g
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de, se --
  de, se -- de a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
