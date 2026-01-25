\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r8^\partTs d d es d c16 b c8 b16[ a]
  b[ a] g8 r4 r8 d' d d
  es16[ d] es8 r4 r8 c c c
}

text = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, lau -- da -- te
  e -- um, lau -- da -- te
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
