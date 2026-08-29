\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r4^\partTc r8 g c c c d
  es2 des
  c8 c f4. e8 es4
}

text = \lyricmode {
  Laßt uns dan mit Ver --
  trau -- _
  en zu un -- _ ſern
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
