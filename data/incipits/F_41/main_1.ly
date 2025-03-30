\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  b'1^\partSc c2 d
  es1 d2 b
  c1 b
  c2 a g1
}

text = \lyricmode {
  Ve -- xil -- _
  la re -- _
  gis pro --
  _ de -- unt
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
