\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "[no tempo]"
  r8^\partVi e'16 h h a g fis g8 e e dis \gotoBar "7"
  \clef soprano e2^\partSs fis
  g a4 g
  g fis r2
}

text = \lyricmode {
  \skips 10
  Be -- ne --
  di -- ctus, qui
  ve -- nit
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
