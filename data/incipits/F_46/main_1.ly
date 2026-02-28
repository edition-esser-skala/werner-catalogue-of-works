\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
  a'4^\partSc d2 cis4
  d8[ a] d4. cis8 h4~
  h a8[ g] fis[ d] d'4~
}

text = \lyricmode {
  Ut que -- ant
  la -- _ _ _
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
