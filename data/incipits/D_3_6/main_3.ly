\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c'1 h2 cis
  d d1 c4 h
  a2 c h a
  gis e'1 c2
}

text = \lyricmode {
  Plan -- _ _
  ge, plan -- _ _
  _ _ _ _
  ge qua -- si
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
