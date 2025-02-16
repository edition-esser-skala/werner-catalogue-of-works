\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key a \minor \time 3/4 \tempoMarkup "Andante" \autoBeamOff
  r4^\partAs e2
  f4 e dis
  h' d, c
  f8[ d] \grace c h4. a8
  a2 r4
}

text = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um
  con -- fu -- gi --
  mus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
