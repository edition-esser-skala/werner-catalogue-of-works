\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
  r4^\part "Die Kinder Gottes" r8 d' d d d d
  d4 r8 d c c f! c
  d4 r8 d g,4. a16[ g]
}

text = \lyricmode {
  Ge -- lo -- bet ſey der
  Herr, der höch -- ſte Weld -- re --
  gent, der "höch -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
