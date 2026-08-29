\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Barmherzigkheit" r8 c' c c f c
  a a r a a a a d
  cis cis r \hA cis e e g, a
}

text = \lyricmode {
  Laß ab von dein Be --
  gin -- nen, weill al -- ler Men -- ſchen
  Sin -- nen zum Böſ -- en iſt "ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
