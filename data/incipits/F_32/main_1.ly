\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  c2^\partAc d c4 f~
  f e f d e c
  \clef soprano g'2^\partSc a g4 c
}

text = \lyricmode {
  Ex -- ul -- tet or --
  bis gau -- di -- is, "or -"
  Ex -- ul -- tet "or -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
