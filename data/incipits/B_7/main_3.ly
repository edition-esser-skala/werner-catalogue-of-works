\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  r2^\partSc c'2. h8[ a] h2~
  h4 a8[ h] c2. h8[ c] d4 c
  h2 c2. h8_[ a] h2
}

text = \lyricmode {
  San -- _ _
  _ _ _ _ _
  ctus, san -- _ "-"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
