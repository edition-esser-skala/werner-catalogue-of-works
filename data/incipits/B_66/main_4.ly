\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \twotwotime \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Allabreve"
  d2.^\partBc e4
  \clef tenor a2.^\partTc b4
  c1
  b4 c d2~
  d cis
}

text = \lyricmode {
  San -- _
  San -- _
  ctus,
  san -- _ _
  \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
