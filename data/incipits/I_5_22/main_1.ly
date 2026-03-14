\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  r2^\partAs g'1
  g2 fis d
  b'1 b2
  a d, a'~
  a g4 fis g2
}

text = \lyricmode {
Sub
  tu -- um prae --
  si -- di --
  um con -- fu --
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
