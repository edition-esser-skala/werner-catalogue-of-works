\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  d'8.^\partSc d16 d8 d d[ g] d4~
  d8[ g] d4. h16[ c] d8[ a]
  h g r4
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  _ _ _
  _ son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
