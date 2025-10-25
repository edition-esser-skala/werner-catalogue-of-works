\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  g'8.^\partSc g16 h8 d h g r4
  g8. g16 h8 g d'2
  d r8 a^\partSs h c
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei --
  son. Pa -- ter de
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
