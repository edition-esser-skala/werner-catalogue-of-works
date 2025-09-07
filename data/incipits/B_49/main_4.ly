\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  a'2^\partSc a
  a2. gis4
  a2*1/2 \clef bass a,4.^\partBc g16[ f] g8[ e]
}

text = \lyricmode {
  San -- ctus,
  san -- _
  ctus, san -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
