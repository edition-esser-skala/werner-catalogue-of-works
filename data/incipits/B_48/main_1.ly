\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
  cis'8.^\partSc cis16 cis8 h a[ h]
  cis4 r8 h a[ h]
  cis4 r8 h a[ h]
  cis
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei --
  son, e -- lei --
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
