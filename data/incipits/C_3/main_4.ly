\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  r4^\partSc a' d r
  r8 cis d e f8. f16 e4
  r8 d c a b4 a8 a~
}

text = \lyricmode {
  Ad te
  le -- va -- vi a -- ni -- mam,
  a -- ni -- mam me -- am, "De -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
