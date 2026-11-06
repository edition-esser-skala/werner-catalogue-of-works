\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  g'16.^\part "Barthlme" g32 g16 g g8 h16 g e4 r8 g
  g g c g a8. e16 e8 a16 e
}

text = \lyricmode {
  Bakts önk mit dem Schwä -- wer -- le -- gaun könts
  ja umb oä -- nen an -- dern ſchaun, wiſts denn
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
