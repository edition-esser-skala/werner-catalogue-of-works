\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
  r4^\partTs b2
  c4. d8 es[ c]
  b4 as g
  as g f
  g4. a8 b4
}

text = \lyricmode {
  Et
  Je -- _ sum,
  be -- _ ne --
  di -- _ ctum
  fru -- _ ctum
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
