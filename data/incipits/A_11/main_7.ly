\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Der verlohrene Sohn" r8 c f f a f
  es es r \hA es es es g \hA es
  d d r d d d a b?
}

text = \lyricmode {
  O Him -- mel wie waß
  hör ich, ſo bin ich dan ver --
  ſtoſ -- ſen, und gäntz -- lich auß -- "ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
