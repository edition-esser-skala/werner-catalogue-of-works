\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \major \time 6/4 \tempoMarkup "Ariosè" \autoBeamOff
  e2^\partAs fis4 gis e a~
  a gis fis e2 a4~
  a gis fis e4. fis8[ gis ais]
  h4
}

text = \lyricmode {
  Ky -- ri -- e __ _ e --
  _ lei -- son, e --
  _ _ lei -- _
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
