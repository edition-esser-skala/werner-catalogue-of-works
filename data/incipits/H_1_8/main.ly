\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  a'8^\partSs e h' c16 d c8 h16 a h8 e,
  e' c16 h a8 a f' d16 c h8 c
  c[ h] c e^\partSc d e h8. c16
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me -- o:
  Se -- de a dex -- tris, se -- de a dex -- tris
  me -- is. Te -- cum prin -- ci -- "pi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
