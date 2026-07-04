\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c'2^\partSc f4 c
  r c f8 f c4
  r c f4. e8
  d4 c b4. b8
}

text = \lyricmode {
  Sub tu -- um
  prae -- si -- di -- um
  con -- fu -- gi --
  mus, con -- fu -- "gi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
