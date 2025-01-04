\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  \partial 2 r8^\part Eliphas b b16 b es \hA b
  g8 g g16 as b c \hA as8 as r16 \hA as c \hA as
  f8. f16 f8 d' b as c b
}

text = \lyricmode {
  Die Peyn iſt al -- zu
  groß, hier muß man bil -- lich ſchwei -- gen, es kan ſich
  wohl daß Loß auf un -- ſern Ruck -- hen
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
