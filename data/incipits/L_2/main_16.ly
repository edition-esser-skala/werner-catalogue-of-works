\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  r16^\part "Schwabnwürth" f, b f d'8 b16 d f8 f16 f f8. f16
  d8 f f8. f16 d4 r8 a
}

text = \lyricmode {
  Auf auf ihr Völk -- le ihr Völk -- le es tä -- get
  ſchon es tä -- get ſchon, I
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
