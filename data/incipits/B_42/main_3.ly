\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  g'2^\partAc fis4 d e fis
  g e \clef soprano d'2^\partSc cis4 a
  h cis d2 d
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- _ Pa -- trem o --
  mni -- po -- ten -- tem,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
