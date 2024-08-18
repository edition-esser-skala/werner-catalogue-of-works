\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 2/1 \autoBeamOff \tempoMarkup "Alla capella"
    \set Staff.timeSignatureFraction = 2/2
  a'1^\partBc b
  a2 g a2. g4
  \clef tenor d'1^\partTc f
  e2 d e2. d4
}

text = \lyricmode {
  San -- _
  ctus, __ _ san -- _
  San -- _
  ctus, __ _ san \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
