\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Der verlohrene Sohn" r8 d f f a d,
  cis cis r e g g b a
  f4 r8 f f f a f
}

text = \lyricmode {
  Ach ſol -- te wohl mein
  Vat -- ter nur gnä -- dig kä -- nen
  ſeyn! da ich nicht nur "al -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
