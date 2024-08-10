\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
  r8^\partSc h'4 d g8
  fis4 r8 d4 d8
  h h d4~ d8.[\trill c32 d]
}

text = \lyricmode {
  Ky -- _ ri --
  e e -- lei --
  son, e -- "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
