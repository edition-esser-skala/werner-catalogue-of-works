\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \dorian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  g'1 b
  a2. a4 f2 d
  d'2. c4 b g b c
}

text = \lyricmode {
  Ad te,
  Do -- mi -- ne, le --
  va -- _ _ _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
