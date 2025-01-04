\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Jobs Frau" r8 g' c c e c
  a r16 a a a a d cis8. cis16 cis8 e
  g, g b a f8. f16 f8 a
}

text = \lyricmode {
  Be -- glückht biſ -- tu mein
  Job! Und wirſt auch ſtets ge -- ſeg -- net ſein ſambt
  mir und al -- len Kün -- dn dein, "ſo -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
