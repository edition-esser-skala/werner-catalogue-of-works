\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key h \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  h'4.^\partSs cis16 d cis8 d e d16[ cis]
  d8 cis h4 r e8 d
  cis4 cis r8 a d cis
}

text = \lyricmode {
  Cre -- di -- di, pro -- pter quod lo --
  cu -- tus sum, e -- go
  au -- tem hu -- mi -- "li -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
