\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 5/4 \tempoMarkup "Adagio" \autoBeamOff
    \once \omit Staff.TimeSignature
  g'\breve*1/8^\partBc f g a a \bar "||"
  \clef tenor \time 4/4 d2.^\partTc c4
  \clef soprano d'2.^\partSc c4
  b2 a4. a8
  e'2 a,
}

text = \lyricmode {
  A -- gnus De -- _ i.
  A -- gnus
  A -- gnus
  De -- i, qui
  tol -- lis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
