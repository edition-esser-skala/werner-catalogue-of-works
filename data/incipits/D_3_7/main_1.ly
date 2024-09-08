\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c'1^\partSc d2 d
  d c1 b2
  b es d d
  d2. d4 d1
}

text = \lyricmode {
  Si -- cut o --
  vis ad oc --
  ci -- si -- o -- nem
  du -- ctus est,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
