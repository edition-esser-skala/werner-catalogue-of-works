\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Der verlohrene Sohn" r8 f f f b d,
  es es r \hA es es es f c
  d d r d e e g b,
}

text = \lyricmode {
  Ach wohl ein lie -- ber
  Vat -- ter der ſei -- ne aig -- ne
  See -- le vor mei -- ne See -- le
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
