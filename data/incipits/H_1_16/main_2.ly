\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  r8^\partSc a' c a e'8. e16 e4
  e8. e16 e8 e e4 e
  e4. f8 e4. e8
  e4
}

text = \lyricmode {
  Lau -- da -- te pu -- e -- ri
  Do -- mi -- num: Lau -- da -- te
  no -- men Do -- mi --
  ni.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
