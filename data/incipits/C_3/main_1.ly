\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d4^\partTs es4. es8 d c
  b4. a8 \clef soprano c'4^\partSs es~
    es8 es d c b4 h8 h
}

text = \lyricmode {
  Re -- _ qui -- em ae --
  ter \hy Re -- _
  qui -- em ae -- ter -- nam, "ae -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
