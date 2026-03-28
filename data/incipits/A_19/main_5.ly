\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Barak" d fis16 fis fis g a8. a16 a8 h
  c a fis16 a \hA fis d b'8 g, r b'
  f8. f16 f f a f d8. d16 d8 f
}

text = \lyricmode {
  Ich ſol -- le zu dem Streit und mei -- nen
  Mueth mit Schweiß und Kräff -- ten par -- ren, ja
  auch mein Blut laßt mich ſo Pflicht, alß Ruhm nicht
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
