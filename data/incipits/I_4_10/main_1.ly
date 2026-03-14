\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
  r4^\partSc d'4. cis8[ d e]
  fis[ d] h[ cis] d[ a] d4~
  d cis d8 fis e d
}

text = \lyricmode {
  Sal -- _
  _ ve ma -- _
  _ ter mi -- se -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
