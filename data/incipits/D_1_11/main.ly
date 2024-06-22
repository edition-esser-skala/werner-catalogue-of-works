\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  r8^\partSs c'4 f8 f c a b16 c
  c8 f, a c es4. d8
  b b d4. a8 a a16 b
}

text = \lyricmode {
  Ec -- ce ho -- mo si -- ne quae --
  rel -- la ve -- rus De -- i
  cul -- tor ab -- sti -- nens se ab
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
