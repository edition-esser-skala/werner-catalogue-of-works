\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
  r4^\partTc g2 \clef alto e'8[^\partAc c]
  a4 f' r f8[ d]
  h4 g' r g8[ e]
  c[ d e c] f[ e] d4
}

text = \lyricmode {
  Ky --  E --
  lei -- son, e --
  lei -- son, e --
  lei -- _ "-"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
