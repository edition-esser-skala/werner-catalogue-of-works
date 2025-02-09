\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r2^\partSs r8 e'4 d8~
  d cis cis h16[ a] gis8 a4 \hA gis8
  a4 r r2
}

text = \lyricmode {
  Lau -- da --
  te no -- men Do -- _ mi --
  ni.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
