\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Judex" f b b a a c es,
  d4 r8 f b b16 b d8 \hA b
  g g r c a8. a16 a8 e
}

text = \lyricmode {
  So kom -- met dan mit Freu -- den
  an, ihr mei -- ne Ge -- be -- ne --
  dey -- te! Be -- ſizt das Reich "an -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
