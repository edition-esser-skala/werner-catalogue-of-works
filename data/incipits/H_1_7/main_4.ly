\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  a'8^\partBs c16[ h] a8 e a,8. a16 a8 e'
  a e c h16 a e'8 e r4
}

text = \lyricmode {
  Ni -- si, ni -- si Do -- mi -- nus ae --
  di -- fi -- ca -- ve -- rit do -- mum,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
