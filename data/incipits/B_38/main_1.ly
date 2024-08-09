\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  d'8.^\partSc d16 d8 e fis8.[\trill a32 g] fis8 e
  d[ e] fis4\trill e r8 e
  fis2\trill fis8 fis, h4
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ son, e --
  lei -- son, e -- "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
