\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  r8^\partBs f a c16 a f8 f r4
  r8 f16 g a8 b16 c d,8 d r4
  g8 g16 a b8 g16 f! e8 d16 c c'8. b16
}

text = \lyricmode {
  Con -- cus -- sum est ma -- re
  et con -- tre -- mu -- it ter -- ra,
  u -- bi Arch -- an -- ge -- lus Mi -- cha -- el de -- "scen -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
