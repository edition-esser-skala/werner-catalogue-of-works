\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 2/1 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  c1^\partAc d
  \clef soprano g1^\partSc a
  h2 c c h
  c4 d e d8[ e] f2 f
}

text = \lyricmode {
  Pa -- _
  Pa -- _
  trem o -- mni -- po --
  ten -- _ _ _ tem, "fa -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
