\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c'4.^\partSc h8 c4. h8
  h4 a8[ gis] a4. g8
  g4 f4. g8[ e f]
}

text = \lyricmode {
  San -- _ _ _
  _ _ _ _
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
