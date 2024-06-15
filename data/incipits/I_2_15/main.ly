\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  a'1^\partSc b
  a2 d1 cis2
  d e f d~
  d cis d1~
  d e
  d r
}

text = \lyricmode {
  A -- _
  ve Re -- _
  gi -- _ na coe --
  _ lo --
  _
  rum,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
