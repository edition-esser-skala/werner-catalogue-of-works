\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/2 \tempoMarkup "Allabreve moderato" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  b'1^\partSc b2 b~
  b es1 es2
  d c c h
  c c c c
  a1 b! %5
}

text = \lyricmode {
  O -- mnes, o --
  mnes a --
  mi -- ci me -- _
  i de -- re -- li --
  que -- runt
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
