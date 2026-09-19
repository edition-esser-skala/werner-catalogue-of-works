\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  a4.^\partBc a8 a4 g
  f2 \clef soprano e''4.^\partSc e8
  e4 d c2
  h a8[ h c d]
}

text = \lyricmode {
  Ky -- ri -- e e --
  "lei -" Ky -- ri --
  e e -- lei --
  son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
