\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  e'8.^\partSc e16 d4 e8. e16 e4
  R1
  r2 e8. e16 d4
  e8. e16 e8 g, a[ h] c h
}

text = \lyricmode {
  Ky -- ri -- e, Ky -- ri -- e
  
  Ky -- ri -- e,
  Ky -- ri -- e e -- lei -- son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
