\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  g'8^\partSs h16 c d8 g fis e d c
  h a16 h c8 h16 d e[ fis] d[ e] c[ d h c]
  a8 h16 c a4 g r
}

text = \lyricmode {
  Cre -- di -- di, pro -- pter quod lo -- cu -- tus
  sum, e -- go au -- tem hu -- mi -- li -- a --
  _ tus sum ni -- mis.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
