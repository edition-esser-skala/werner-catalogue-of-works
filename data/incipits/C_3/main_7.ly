\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d4.^\partTs d8 cis4 d~
  d c4. c8 b4
  \clef soprano d'4.^\partSs d8 cis4 d
  d c4. c8 b4
}

text = \lyricmode {
  A -- gnus De -- _
  i, qui "tol -"
  A -- gnus De -- _
  i, qui "tol -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
