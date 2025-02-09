\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "Adagio"
  fis8^\partVi a d e16 fis e d cis d \gotoBar "7"
  \clef soprano \autoBeamOff a2^\partSc d4
  h2 e4
  d8[ cis h a h cis]
}

text = \lyricmode {
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
