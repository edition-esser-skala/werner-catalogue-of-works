\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  d4^\partTs a e'8[ cis] a g
  g[ fis] fis g a a c[ h]
  g4 r r2
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
