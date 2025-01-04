\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  f,8^\part Leviathan f b16 b b d g,8 g g f
  as8. as16 as8 g es r es' c
  a! g b a fis fis d' b
}

text = \lyricmode {
  Al -- les geth nach Wunſch und Wil -- len, nun find
  ſich Ver -- zweiff -- lung ein, reitz ich
  ihn zum Werks -- er -- fül -- len, ſoll diß
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
