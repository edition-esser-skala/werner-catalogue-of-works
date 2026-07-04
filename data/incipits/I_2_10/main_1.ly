\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
    \set Staff.timeSignatureFraction = 2/2
  a'1^\partSc a2 a
  a1 f2 d
  b'2. a4 g f d e
  f g a h c2. h4
}

text = \lyricmode {
  A -- ve Re --
  gi -- na coe --
  lo -- _ _ _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
