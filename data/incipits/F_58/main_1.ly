\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 3/2
  r2^\partSc f a4 f
  b8[ c d es] f4 d c c
  f,2 r r4 c'
}

text = \lyricmode {
  Chri -- sto pro --
  fu -- _ sum san -- gui --
  ne et
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
