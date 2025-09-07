\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  a4.^\partTs f'8 e d cis d16[ e]
  \clef soprano r8^\partSs d' a b16 c b4 b8 b
  b a g4 f r
}

text = \lyricmode {
  A -- gnus De -- i, a -- gnus
  qui tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
