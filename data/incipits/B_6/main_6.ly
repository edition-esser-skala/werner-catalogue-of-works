\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  d4.^\partTs d8 d[ a] fis a
  d,4 d r8 d16[ fis] fis[ a] a[ h]
  c4 a8 fis dis dis dis4
  e8
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di, pec -- ca -- ta mun --
  di,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
