\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 6/8 \tempoMarkup "Adagio" \autoBeamOff
  e2^\partSc dis4
  e a cis
  cis8[ h] a[ gis] fis[ e]
  e4 d r
  h'8[ fis' eis fis e d]
}

text = \lyricmode {
  Ky -- ri --
  e __ _ e --
  lei -- son, e --
  lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
