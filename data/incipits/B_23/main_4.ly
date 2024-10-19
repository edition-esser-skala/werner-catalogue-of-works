\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key a \minor \time 2/2 \autoBeamOff \tempoMarkup "Molto moderato"
  a'1^\partSc
  a
  h
  a
}

text = \lyricmode {
  Be --
  ne --
  di --
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
