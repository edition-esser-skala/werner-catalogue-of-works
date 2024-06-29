\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/2 \tempoMarkup "Allabreve assai" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  g'1^\partSc a2 h
  c a h c
  c h a1
  g2
}

text = \lyricmode {
  Do -- ctor e --
  gre -- gi -- e, do --
  _ ctor Pau --
  le,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
