\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r4^\partSc b' es8. es16 es4
  es d8 c d c b8. b16
  \tempoMarkup "Allegro" a8 f a c f e16[ d] c[ b] a[ g]
}

text = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num, et ex -- ul -- ta -- vit, ex -- "ul -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
