\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  d'8.^\partSc d16 d8 c h[ g] e' d
  d4 d8 c16[ h] h4 a8 h16[ c]
  d8[ h] c h a4 g
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son, e --
  lei -- son, e -- lei -- son, e --
  lei -- son, e -- lei \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
