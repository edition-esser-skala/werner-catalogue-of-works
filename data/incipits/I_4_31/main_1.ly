\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d'4^\partSs es2 es4
  d2 cis
  d8 c b a b4 b
}

text = \lyricmode {
  Sal -- _ ve
  Re -- gi --
  na, ma -- ter mi -- se -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
