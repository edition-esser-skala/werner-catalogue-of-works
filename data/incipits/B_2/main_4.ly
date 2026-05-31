\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  a,4^\partBc a'4. g8[ f e]
  f2 e
  \clef soprano d'4^\partSc d'4. c8[ h a]
  h4 e2 d4
}

text = \lyricmode {
  San -- _ _
  _ ctus,
  San -- _ _
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
