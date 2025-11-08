\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  d'8.^\partSc a16 a8 a h[ a] \grace a g4
  fis r8 fis16[ g] a4 d8 a
  a g r e16[ fis] g4 e'8 g,
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son, e -- lei -- son, e -- 
  lei -- son, e -- lei -- son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
