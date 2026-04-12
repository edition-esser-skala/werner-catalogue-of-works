\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Jahel" d' g d es8. es16 es8 g
  c, g g a b b b16 b c g
  a8 a r16 a cis e f8. f16 f8 d
}

text = \lyricmode {
  Mein Herr wie den -- keſt du ſo
  vor -- theil -- hafft und guet vor mei -- ne Ohn -- machts --
  kräff -- ten, ſchreib doch daß Lor -- ber -- recht dem
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
