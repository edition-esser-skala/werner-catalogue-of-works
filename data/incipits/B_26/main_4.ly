\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  g'4.^\partSc a8 h[ c d e]
  f2 e8[ d] c[ h]
  ais4 h2 a4~
  a8[ g16 fis] g2 fis4
}

text = \lyricmode {
  San -- _ _
  _ _ ctus,
  san -- _ _
  _ ctus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
