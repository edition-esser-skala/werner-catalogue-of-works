\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key a \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  e4^\partAs a gis
  a2 e4
  fis2 e4~
  e8 fis d4. d8
  cis4 r r
}

text = \lyricmode {
  Be -- a -- tus
  vir qui
  ti -- _
  met Do -- mi --
  num:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
