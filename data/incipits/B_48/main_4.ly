\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  cis'2.^\partSc d4
  d4. e8 cis2
  h8 d e fis g4. fis8
}

text = \lyricmode {
  San -- ctus,
  san -- ctus, san --
  ctus Do -- mi -- nus De -- us,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
