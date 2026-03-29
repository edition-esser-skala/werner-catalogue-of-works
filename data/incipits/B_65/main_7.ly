\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r4^\partTs a8 d d4 cis8 cis
  d a b4 b a8[ g]
  f d d' h gis4 a8[ h]
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di: Mi -- se -- re -- re
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
