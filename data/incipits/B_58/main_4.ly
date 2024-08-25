\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
  d'4^\partSc d,8 r r4
  d' d,8 r r4
  d' d,8 r r4
  d'4. d8 c c
  c4 r r
}

text = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus,
  san -- ctus Do -- mi --
  nus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
