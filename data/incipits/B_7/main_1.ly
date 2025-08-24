\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Alla capella moderato"
  r2 r4 e8[^\partAc c]
  a4 f' r f8[ d]
  h4 g' r g8[ e]
  c[ d e c] f[ e] d4
}

text = \lyricmode {
  E --
  lei -- son, e --
  lei -- son, e --
  lei -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
