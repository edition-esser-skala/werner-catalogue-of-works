\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
  a'2^\partSc g
  f4 r r2
  b a
  g4 r r2
  c4. c8 c4 c
}

text = \lyricmode {
  Re -- qui -- 
  em 
  ae -- ter -- 
  nam 
  do -- na e -- is, 
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
