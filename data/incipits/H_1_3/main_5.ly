\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  r8^\partSs c' g a g e16 f g8 a
  a16[ g] g8 r c^\partSc a a g g
  c c a8. a16 h4 r
}

text = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, lau -- da -- te e -- um,
  o -- mnes po -- pu -- li.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
