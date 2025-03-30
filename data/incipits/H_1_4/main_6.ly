\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partAs f g a8 b a4 g8 f
  g4 a8 b a4 \clef soprano c^\partSs d d
  e f8 f f4 e f e8 d
}

text = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma,
  a -- ni -- ma "me -" Qui -- a re --
  spe -- xit hu -- mi -- li -- ta -- tem "an -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
