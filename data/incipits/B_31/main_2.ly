\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Allegreo"
  d'4^\partSc d d d,
  d' fis h, cis
  d c2 h4
  a4. a8 g2
}

text = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni --
  bus bo -- nae
  vo -- lun -- "ta -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
