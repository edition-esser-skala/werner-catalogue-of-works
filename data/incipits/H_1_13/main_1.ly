\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  c'2.^\partSc h4 c4. c8
  a4 d2 c8 d h4 g
  c2 a4 d h2
}

text = \lyricmode {
  Di -- xit Do -- mi --
  nus Do -- mi -- no me -- o:
  Se -- de a "dex -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
