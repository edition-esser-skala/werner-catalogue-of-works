\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Gerechtigkheit" r8 a a a f a
  a e r a g g b a
  f4 r8 f a a a c!
}

text = \lyricmode {
  Weil ich kein Macht nun
  ha -- be al -- hier in di -- ſer
  Zeit, ſo wil ich dan jezt
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
