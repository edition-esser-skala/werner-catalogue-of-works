\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  b'2^\markup \remark "S 1 solo" c4. c8
  d4 d d d
  d d es c8 c
  b4 a b c
  c2 b4 r
}

text = \lyricmode {
  De la -- men --
  ta -- ti -- o -- ne
  Ie -- re -- mi -- ae Pro --
  phe -- _ _ _
  tae. __ _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
