\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
    \set Staff.timeSignatureFraction = 2/2
  d'1^\partSc h2 g
  e'1 cis2 a
  fis'2. fis4 d h e2~
  e d1 c!2
}

text = \lyricmode {
  San -- _ ctus,
  san -- _ ctus,
  san -- ctus, san -- _ _
  _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
