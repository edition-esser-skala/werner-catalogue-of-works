\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Judex" es8 g h! h r d16 f,
  es8 es r c'16 g e8 r16 g b8 as
  f f r as16 c fis,8 fis a c,
}

text = \lyricmode {
  Hört ihr Him -- mel was ich
  ſa -- ge, und die Erd ver -- nehm die
  Kla -- ge, ſo ich jezt er -- khlä -- ren
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
