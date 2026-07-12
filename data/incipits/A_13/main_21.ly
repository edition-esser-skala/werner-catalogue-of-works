\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  a'2^\partSc b8 b h h
  c g c4 c4. c8
  a4. a8 g g g g
}

text = \lyricmode {
  Wür ſtim -- men dan ein --
  häl -- lig ein Lob und
  Danckh -- lied an weils Gott "al -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
