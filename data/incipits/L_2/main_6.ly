\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Barthlme" r8 g' c r16 g e8 r16 g
  c,8 r16 e e8 a g16 g g a b8 b16 a
}

text = \lyricmode {
  Ob -- wohl ob -- ſchon ob --
  gleich und ſin -- te -- mall der ley -- dig krach düer -- re
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
