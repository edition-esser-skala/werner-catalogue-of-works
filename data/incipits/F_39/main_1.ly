\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  r8^\partAc e e e a4 c
  h a4. gis16[ fis] \hA gis4
  a8 \clef soprano a^\partSc a a d4 f
}

text = \lyricmode {
  Coe -- le -- stis urbs Je --
  ru -- _ _ sa --
  lem, Coe -- le -- stis urbs "Je -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
