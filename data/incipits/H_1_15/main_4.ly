\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  r8^\partSs a' a16[ cis] e[ g] f8 e16 d e8. e16
  d4 r r2
  r r8 g,^\partSc c c
}

text = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num:
  A so -- lis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
