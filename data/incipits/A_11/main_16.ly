\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Presto"
  r8^\partVi e'd c r f e d
  r g f e \gotoBar "19" \clef bass r4^\part "Gerechtigkheit" c,
  h d c c,
  r a' h c
}

text = \lyricmode {
  \skips #9
  Er --
  öff -- ne dei -- nen,
  er -- öff -- ne
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
