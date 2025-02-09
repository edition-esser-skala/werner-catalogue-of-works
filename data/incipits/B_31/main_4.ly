\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  a'4^\partSc d h8[ a] h4
  a r r2
  r a4 d
  cis r r2
}

text = \lyricmode {
  San -- ctus, san -- _
  ctus,
  san -- _
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
