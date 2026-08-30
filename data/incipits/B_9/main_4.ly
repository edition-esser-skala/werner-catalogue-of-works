\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  a'2^\partBc a, a'~
  a4 gis e fis gis a
  h2. a4 fis gis
  a2 fis1
}

text = \lyricmode {
  San -- ctus, san --
  _ _ _ _ _
  _ _ _ _
  ctus, "san -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
