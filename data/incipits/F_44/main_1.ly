\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key e \phrygian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  e1^\partTc d2 h
  c1 h2 e~
  e d \clef soprano e'1^\partSc
  d2 h c1
}

text = \lyricmode {
  Iam sol re --
  ce -- dit i --
  gne -- Iam
  sol re -- "ce -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
