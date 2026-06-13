\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d'2^\partSc es4 es
  r e f es
  d cis d4. d8
  d d4 b8 g g r4
}

text = \lyricmode {
  Par -- _ ce,
  par -- _ ce
  mi -- hi Do -- mi --
  ne, ni -- hil e -- nim
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
