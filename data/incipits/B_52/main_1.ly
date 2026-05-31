\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  c'4.^\partSc c8 c16[ a] d8 b16[ g c8]
  a c16[ b] a8[ d] g, c4 h8
  c e16[ d] c8.[ b16] a8 a d16[ b g8]
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- son, e -- lei --
  son, e -- lei -- son, e -- "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
