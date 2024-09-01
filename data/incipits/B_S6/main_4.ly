\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  c'2^\partSc c4. h16[ a]
  h2 b~
  b4. a16[ g] a2
}

text = \lyricmode {
  San -- _ _
  ctus, san --
  _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
