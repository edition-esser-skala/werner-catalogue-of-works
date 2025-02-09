\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  a'4.^\partSs d8 fis,[ a] c h
  g4 g8 h e, gis h[ d]
  cis!4 d8 e fis4. e8
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se -- re -- re
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
