\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
  g'4.^\partSs g8 a h c4
  h r r2
  r8 a4 e'16[ g] fis8. e16 d4
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  son,
  Chri -- ste au -- di nos,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
