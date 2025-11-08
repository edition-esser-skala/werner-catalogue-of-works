\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/2 \tempoMarkup "Adagio" \autoBeamOff
  g'4.^\partSc g8 g4 g
  a2 a
  b4. b8 b4 b
  a4. a8 g4 r8 g
}

text = \lyricmode {
  Re -- qui -- em ae -- 
  ter -- nam 
  do -- na e -- is, 
  Do -- mi -- ne, et
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
