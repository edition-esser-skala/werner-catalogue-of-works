\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \minor \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
  r8 a^\partTc a a c4 h~
  h8 cis d4. c8 h8. h16
  a8 \clef soprano a'^\partSc a a c4 h8 cis
}

text = \lyricmode {
  De -- us tu -- o -- rum, __
  tu -- o -- rum mi -- li --
  tum, De -- us tu -- o -- rum, "tu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
