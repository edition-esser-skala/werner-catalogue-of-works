\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part Schöpffer e, e16 e g a f8 f f16 a f c
  d8 d r fis a a c h
  g g r h dis, fis a g
}

text = \lyricmode {
  Weill du dem -- nach, mein Job, er -- tuld ſo bitt -- re
  Schmer -- tzen, und doch in dei -- nen
  Her -- tzen nie -- mahl von mei -- nen
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
