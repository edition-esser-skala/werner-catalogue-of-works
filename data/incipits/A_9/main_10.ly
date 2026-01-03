\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 6/8 \autoBeamOff \tempoMarkup "Tempo sicilian[o]"
  \partial 8 d'8 b4.~ b8. a16 g8
  g4\trill fis8 r r d'
  es!4. es8.[ d16] cis8
}

text = \lyricmode {
  Glückh -- ſee -- li -- ge
  Au -- gen! die
  ihr mit der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
