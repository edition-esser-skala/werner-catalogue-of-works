\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
  e'2.^\partSc d4 c d
  e4. e8 e4 d c d
  e2 e4 d c d
}

text = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
