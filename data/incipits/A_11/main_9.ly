\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Der mitleidige Vatter" r8 g e4 r16 e f g
  c,4 r8 e g g c g
  a a r a a a f a
}

text = \lyricmode {
  Mein Sohn! khom oh -- ne
  Scheu, wie ſehr hat mich ver --
  lan -- get nach dei -- ner Reu und
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
