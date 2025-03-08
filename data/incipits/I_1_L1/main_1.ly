\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Andante cantabile"
  R2.*14
  d2 d4
  e fis g
  fis8[ e] d4 c
  c8[ h] h4 d
}

text = \lyricmode {
  Al -- ma 
  Re -- _ dem -- 
  pto -- _ ris
  ma -- ter, quae
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
