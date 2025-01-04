\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  h8^\part Job dis fis a, g8. g16 g8 h
  d d16 e f8 e c c r c16 e
  a,8 g b a f4 f'8 d
}

text = \lyricmode {
  Al -- les hat ſein Zihl und End, doch
  will ſich bey mir nichts zeü -- gen, weill der
  Schmertz ſchon all -- be -- hend im -- mer
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
