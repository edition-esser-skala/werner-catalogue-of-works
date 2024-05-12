\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  r8^\partSc g' c g r c e c
  r e g e c e16[ c] g8 e16 g
  e8 c16 e g8 c16 e g8 g, r4
}

text = \lyricmode {
  E -- sto -- te, e -- sto -- te,
  e -- sto -- te for -- tes, for -- tes in
  bel -- lo, in bel -- lo, in bel -- lo,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
