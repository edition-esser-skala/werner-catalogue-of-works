\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 2/2 \tempoMarkup "Adagio"
  c'4^\partVi g fis8 g a g
  g4 c e c \gotoBar "9"
  \clef soprano \autoBeamOff c^\partSc g fis8[ g] a[ g]
  g4 c e c
  d g, fis8[ g] a[ g]
}

text = \lyricmode {
  \skips 10
  Ky -- _ _ ri --
  e e -- lei -- _
  _ son, Ky -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
