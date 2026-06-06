\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
  e8[^\partBs g16 fis] e8[ dis] e[ c']
  h4 h, e8[ fis]
  g4. fis16[ e] d8.[ c16]
}

text = \lyricmode {
  Be -- _ ne --
  di -- ctus, qui
  ve -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
