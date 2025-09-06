\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  f4.^\partAc f8 e2
  \clef soprano a4.^\partSc a8 a4 gis
  a4. a8 b!2
  a
}

text = \lyricmode {
  Di -- es i --
  Di -- es i -- rae,
  di -- es il --
  la
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
