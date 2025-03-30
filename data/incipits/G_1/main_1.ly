\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
  a'8.^\partSc a16 cis8 a e' h r e~
  e d d8. cis16 cis8 cis a4~
  a8 gis fis8. fis16 gis8 h^\partSs e h
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son, Chri --
  ste au -- di nos, Chri -- ste __
  ex -- au -- di nos, Pa -- ter de
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
