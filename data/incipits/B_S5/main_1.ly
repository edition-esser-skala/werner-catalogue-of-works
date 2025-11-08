\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 2/4 \autoBeamOff \tempoMarkup "Allegro moderato"
  d'4 e
  fis r
  h,8. h16 h8 h
  cis4 cis
  d e
  fis r
}

text = \lyricmode {
  Ky -- ri -- 
  e,
  Ky -- ri -- e e -- 
  lei -- son,
  Ky -- ri -- 
  e,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
