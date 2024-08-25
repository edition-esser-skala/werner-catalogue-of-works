\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  d'8.^\partSc d16 d8 cis d[ fis16 e] d8[ cis]
  d4 r8 cis d[ fis16 e16] d8[ cis]
  d4 r8 e fis8.[ e16] d4
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  son, e -- lei -- _
  son, e -- lei -- \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
