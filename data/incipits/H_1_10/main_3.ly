\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  e2^\partBs h'2. a4
  g2 r4 fis e d!
  c h a2. a4
  g2 g'4 g e e
}

text = \lyricmode {
  Be -- a -- tus
  vir qui ti -- _
  met _ Do -- mi --
  num: In man -- da -- tis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
