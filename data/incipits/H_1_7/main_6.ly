\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Passato"
  f,4^\partTs g8. a16 b8 b8. b16 a8
  g c4 b8 a d4 c8
  b8. b16 a4 r2
}

text = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma
  me -- _ a Do -- _ _
  _ mi -- num,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
