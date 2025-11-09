\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r8^\partAs c[ e] g f[ d] h g16[ f']
  f8[ e] e16[ f] g[ a] b8 cis, cis4
  d8 f a f dis2
  e
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di, pec -- ca -- ta mun --
  di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
