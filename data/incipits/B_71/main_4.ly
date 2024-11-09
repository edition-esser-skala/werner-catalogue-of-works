\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  f2.^\partAc e4
  d2 c
  d4 e fis \clef soprano d'~^\partSc
  d c h c
}

text = \lyricmode {
  San -- ctus,
  san -- ctus,
  san -- ctus, san -- San --
  ctus, san -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
