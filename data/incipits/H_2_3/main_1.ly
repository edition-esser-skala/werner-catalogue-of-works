\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  d8^\partTs c16 h a8 d h a g8. g16
  fis4 d'8 d e[ d] e d
  cis4. c8 h4 e8 a,
}

text = \lyricmode {
  Cre -- di -- di, pro -- pter quid lo -- cu -- tus
  sum, e -- go au -- tem hu --
  mi -- li -- a -- tus sum
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
