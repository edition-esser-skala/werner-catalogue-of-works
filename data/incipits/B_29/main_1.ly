\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \tempoMarkup "Adagiosè" \autoBeamOff
  a'4.^\partSc h8 gis4 r
  r8 g4 a8 fis4 r
  r8 d g[ a] h8.[ c16] d4
}

text = \lyricmode {
  Ky -- ri -- e
  e -- lei -- son,
  e -- lei -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
