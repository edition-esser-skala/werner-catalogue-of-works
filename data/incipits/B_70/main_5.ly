\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c'1.^\partSc b4 a
  b2 d1 c4 h
  c2 c1 b2
  b a1 g2
  a1
}

text = \lyricmode {
  A -- gnus _
  De -- i, qui _
  tol -- lis pec --
  ca -- ta mun --
  di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
