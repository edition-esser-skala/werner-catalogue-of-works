\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "St: Michael" c es16 es g c, as'8 as r f
  f as g d es es r4
  \clef soprano \tempoMarkup "Adagio" b'2^\partSc r8 b b b
  as4. as8 g4 r8 g
}

text = \lyricmode {
  Auf, auf, ihr Tod -- ten, ey -- let! Ihr
  ſolt vor Grich -- te ge -- hen.
  Ô, ô har -- te
  Don -- ner -- worth! Wer
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
