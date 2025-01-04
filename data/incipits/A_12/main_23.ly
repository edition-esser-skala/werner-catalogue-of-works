\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "[Recitativo]"
  r8^\part Eliphas a d a b r16 \hA b d8. \hA b16
  g8 h d16 d d e! c8 c r16 c e c
  a8 a d16 d f d h!8 d c \tuplet 3/2 8 { f16[( e d)] }
}

text = \lyricmode {
  Ô Job, mein Freund! ſo helf -- fe
  doch, da -- mit wir Gnad er -- lan -- gen. Dan wie es
  ſcheint, ſo ſeynd wir all mit Sa -- thans Strickh "ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
