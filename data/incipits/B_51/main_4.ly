\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
  a'4^\partSc a r
  d d r
  h a2
  a r4
}

text = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- _
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
