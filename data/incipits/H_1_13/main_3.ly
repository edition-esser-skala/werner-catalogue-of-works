\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  e2^\partAs g fis
  e r4 d c2
  h a4 h8[ c] h4 a
  g2
}

text = \lyricmode {
  Be -- a -- tus
  vir qui ti --
  met Do -- _ _ mi --
  num:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
