\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  g'8^\partSs c h16[ c] d8 c16[ h] c8 r4
  r8 g g a16 b a[ g a8] a4
  r8 a a h16 c h[ a h8] h4
}

text = \lyricmode {
  A -- gnus, a -- gnus De -- i,
  qui tol -- lis pec -- ca -- ta,
  qui tol -- lis pec -- ca -- ta,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
