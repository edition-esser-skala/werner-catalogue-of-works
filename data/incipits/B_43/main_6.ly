\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d4.^\partTs a8 b!4 cis
  d8 a d e16 f g8[ e] c[ b]
  gis[ a] a4 r8 f'4 f8
}

text = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec -- ca -- ta
  mun -- di: Mi -- "se -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
