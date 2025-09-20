\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  a'4.^\partSc a8 b2~
  b4 a8[ g] a a a[ b]
  c!4 c b a
}

text = \lyricmode {
  A -- gnus De --
  _ i, qui tol --
  lis pec -- ca -- ta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
