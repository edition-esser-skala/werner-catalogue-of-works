\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  f2^\partSc g4 g8 g
  a8. a16 a4 a8 a g4
  g8 c4 d16[ e] f8 f, r c'
}

text = \lyricmode {
  In ex -- i -- tu
  Is -- ra -- el de Ae -- gy --
  pto do -- mus Ja -- cob de
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
