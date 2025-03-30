\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  g'4.^\partBc fis8 b4 a
  r8 g4 f8 es4 d
  c8[ b16 a] g8[ a] b4 a
  d8[ b' g a] d,4 r
}

text = \lyricmode {
  Ky -- ri -- e __ _
  e -- _ lei -- son,
  e -- lei -- son, e -- 
  lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
