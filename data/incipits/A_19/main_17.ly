\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Jahel" c' f c c g r r16 a
  b8 b16 d c8 g a a r a
  e'16 e e16. e32 e16 cis a b g8 g r16 g g a
}

text = \lyricmode {
  Er -- freu -- te Hoff -- nung! du
  haſt mich nicht hin -- ter -- gan -- gen, Ich
  ßeh den Si -- se -- ra in ei -- nen ban -- gen, und forcht -- "ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
