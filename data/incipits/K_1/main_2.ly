\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Moderato"
    \set Staff.timeSignatureFraction = 2/2
  r2^\partSic h'2. c4 d c8[ h]
  a2. h8[ c] d2. e8[ fis]
  g4 g,2 a8[ h] c2. d8[ e]
}

text = \lyricmode {
  Vau __ _ _ _
  _ _ _ _
  _ _ _ _ _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
