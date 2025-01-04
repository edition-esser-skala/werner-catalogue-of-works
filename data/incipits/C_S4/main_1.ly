\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  R1^\partTc
  r2 e4 e
  e2 e\fermata
}

text = \lyricmode {
  Di -- es
  il -- la,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
