\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  c'2.^\partSc d8[ e]
  f4 e8 d c4. b8
  a4 d c4. c8
}

text = \lyricmode {
  Pu -- er
  na -- tus in Beth -- le --
  hem, in Beth -- "le -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
