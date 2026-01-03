\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  r8^\part "Judex" f16 f a a c a fis8 fis16 fis a a c b
  g8 g \clef soprano d''4^\partSc r es
  r8 d16 d d d f es c8 c r c
}

text = \lyricmode {
  Nun werd ich mein Mueth er -- khiel -- len an di -- ſen La -- ſter --
  bö -- ckhen. Ach! ach!
  daß die Berg he -- rüe -- ber füeh -- len, uns
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
