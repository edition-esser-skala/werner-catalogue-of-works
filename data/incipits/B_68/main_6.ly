\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  g'4.^\partAs h8 a e4 g8
  fis d r fis g a h4
  a r r2
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
