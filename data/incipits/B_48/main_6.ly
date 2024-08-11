\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  cis'4^\partSc d d cis
  h fis' eis d!8 d
  cis4 d2 cis4
  h a gis2
}

text = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec --
  ca -- _ ta
  mun -- _ di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
