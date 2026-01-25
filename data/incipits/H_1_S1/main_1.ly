\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c'4^\partSc c c c8 c
  d4 d8 d e4 d8 d
  c h r4 r2
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do -- mi -- no, Do -- mi -- no
  me -- o
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
