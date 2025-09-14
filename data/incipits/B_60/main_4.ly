\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
  a'8[^\partSc cis16 h] cis8[ d e e,]
  a4. h8 cis[ h16 cis]
  d8[ e16 fis] e8[ h e d]
  cis4
}

text = \lyricmode {
  San -- _
  _ _ _
  _ _
  ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
