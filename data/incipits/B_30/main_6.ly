\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
    \once \override Staff.TimeSignature.style = #'single-digit
  e'8.[^\partSc g32 f] e8 d e4
  d8 dis e4 e
  r8 h c[ cis] d4~
}

text = \lyricmode {
  A -- _ gnus De --
  i, qui tol -- lis
  pec -- ca \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
