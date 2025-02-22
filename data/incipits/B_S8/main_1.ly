\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "Adagio"
  fis8^\partVi a d e16 fis e d cis d
  h4 4 g'8 e \gotoBar "7"
  \clef soprano \autoBeamOff a,2^\partSc d4
  h2 e4
  d8[ cis h a h cis]
  d4 d
}

text = \lyricmode {
  \skips 13
  Ky -- ri -- 
  e e -- 
  lei -- 
  _ son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
