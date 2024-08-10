\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key h \phrygian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  h'4^\partBs fis d8 h r d'
  cis fis, r fis d h r d'
  g,16[ h32 a h16 d,] cis[ e'32 d e16 g,] fis[ a32 g a16 c,] h[ h'32 a h16 d,]
}

text = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit in
  no -- _ _ "-"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
