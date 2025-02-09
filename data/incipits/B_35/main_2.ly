\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c'4^\partSc c c c,8 g'
  c g e g c,4 r
}

text = \lyricmode {
  Et in ter -- ra, in
  ter -- ra, ter -- ra pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
