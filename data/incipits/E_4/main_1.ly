\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  r4^\partSs r8 g' c c e g
  h, d f e c c r4
  a8 cis e a, f'8. f16 f4
}

text = \lyricmode {
  Ma -- ri -- a Wur -- zel
  Da -- vids ſey ge -- grüſ -- ſet!
  die du voll der Gna -- de biſt.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
