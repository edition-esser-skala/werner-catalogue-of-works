\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partSs d' a
  f'2 e4
  r d c!
  b4. b8 a4
}



text = \lyricmode {
  Be -- ne --
  di -- ctus,
  be -- ne --
  di -- ctus, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
