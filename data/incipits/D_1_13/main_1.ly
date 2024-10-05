\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
  d'4^\partSc r8 d d d
  d d r d d d
  d d r h e d
}

text = \lyricmode {
  Te, te in -- vo --
  ca -- mus, te ad -- o --
  ra -- mus, te ad -- "o -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
