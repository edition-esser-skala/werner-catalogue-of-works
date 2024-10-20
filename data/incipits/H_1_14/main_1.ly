\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
  c'8^\partSc c c8. c16 h8 d d d
  e e c4. c8 r d
  d d r d e e d4
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris, a dex -- tris "me -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
