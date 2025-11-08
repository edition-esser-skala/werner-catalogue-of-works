\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Adagietto"
  c16^\partVi e8 g c e16 \clef soprano g,4.^\partSc f'8
  e r r g, g4. f'8
  e r r4 c4. a8
  c4.
}

text = \lyricmode {
  \skips 5
  Ky -- ri --
  e e -- lei -- _
  son, Ky -- ri -- 
  e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
