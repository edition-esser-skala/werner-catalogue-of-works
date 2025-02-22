\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "Adagio"
  e2^\partVi dis4
  e a cis
  cis8 h a gis fis e \gotoBar "9"
  \clef soprano \autoBeamOff e2^\partSc dis4
  e a cis
  cis8[ h] a[ gis] fis[ e] 
}

text = \lyricmode {
  \skips 11
  Ky -- ri --
  e __ _ e --
  lei -- son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
