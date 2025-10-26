\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  b'1^\partSc c2 d
  es1 d2 b
  f'2. es4 d c d2
}

text = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
