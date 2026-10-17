\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r8^\partSc c' h a e'2~
  e8 c h8. h16 a8 c h16[ c] d8
  g,4. c8 h c4 h8
}

text = \lyricmode {
  Je -- su re -- dem --
  ptor o -- mni -- um quem lu -- cis
  an -- te o -- ri -- "gi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
