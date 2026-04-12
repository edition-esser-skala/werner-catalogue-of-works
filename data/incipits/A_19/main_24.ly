\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  r8^\partSc d' d g e8. e16 g8 e
  e d r4 c8. c16 a'8 c,
  c h r h c4 r8 cis
}

text = \lyricmode {
  So ſey dir Dank ge -- ſagt vor
  al -- len, Dank ge -- ſagt vor
  al -- len, ô Held! ô
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
