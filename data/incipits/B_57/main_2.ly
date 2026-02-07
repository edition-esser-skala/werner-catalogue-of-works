\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  d1.^\partBc d2
  f c d2. c4
  b2 b \clef soprano a''2^\partSc a
  b f g2. g4
  a2 a h cis
}

text = \lyricmode {
  Et in
  ter -- ra, ter -- _
  _ ra Et in
  ter -- ra, ter -- ra
  pax, in ter -- ra
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
