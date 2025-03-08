\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  a'2.^\partBc g4
  f e d2
}

text = \lyricmode {

}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
