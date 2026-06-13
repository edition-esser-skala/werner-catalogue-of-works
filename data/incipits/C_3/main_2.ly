\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  d4.^\partTc d8 es es es es
  fis,2 g8 g d'4~
  d8 b g4. b8 a g
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e -- lei --
  son, Ky -- ri -- e "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
