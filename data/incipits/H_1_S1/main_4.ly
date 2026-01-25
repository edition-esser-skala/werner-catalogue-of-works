\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key es \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partTs r8 b c16[ b] b8 r es
  c b as b16 as g f es8 r4
  r8 b' es es es d16[ es] c8. c16
  b4
}

text = \lyricmode {
  Lau -- da -- te, lau --
  da -- te pu -- e -- ri Do -- mi -- num,
  lau -- da -- te no -- men Do -- mi --
  ni
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
