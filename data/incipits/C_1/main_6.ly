\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  c'4.^\partSc es8 as,4 as
  r8 g h d es g4 es8
  c4. d16[ es] f2
}

text = \lyricmode {
  A -- gnus De -- i,
  De -- i, qui tol -- lis pec --
  ca -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
