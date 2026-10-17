\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Tempo giusto"
  \partial 4 d'4^\partSc g,2 a4
  h2 cis4
  d2 e4
  d2 d4
  g,2 a4
}

text = \lyricmode {
  In dul -- ci
  ju -- bi --
  lo, __ _
  _ nun
  ſin -- get
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
