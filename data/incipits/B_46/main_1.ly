\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Allegretto o vivace"
  c'8.^\partVi c,16 c d32 e f g a h c8. c,16 c c' h c
  h c a h g f' e f e f d e c c, h c \gotoBar "12"
  \clef soprano \autoBeamOff c'8.^\partSc c16 d8 g e c r4
  c8. c16 d8 h c c r4
}

text = \lyricmode {
  \skips 31
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
