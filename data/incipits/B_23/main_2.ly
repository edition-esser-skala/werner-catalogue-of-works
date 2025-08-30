\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  r2^\partTc c h g
  a h \clef soprano c'1^\partSc
  h2 g a h
}

text = \lyricmode {
  Pa -- trem o --
  mni -- po Pa --
  trem o -- mni -- "po -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
