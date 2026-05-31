\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
  c4^\partAc f4. e8[ a, h]
  c8.[ d32 e] f4 \clef soprano g4^\partSc c~
  c8[ h e, fis] g4. a8
  d,4 r d'4. c8~
}

text = \lyricmode {
  San -- _ _
  _ _ San -- _
  _ _
  ctus, san \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
