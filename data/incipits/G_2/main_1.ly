\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  d'8.^\partSc d16 d8 d d d r4
  r2 d4 c8 c
  d d r4 r2
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Chri -- ste e --
  lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
