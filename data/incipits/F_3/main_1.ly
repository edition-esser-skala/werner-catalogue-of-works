\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  a'2^\partSc h g4 h
  c4. c8 d4 c h4. h8
  a4
}

text = \lyricmode {
  Ex -- ul -- tet, ex --
  ul -- tet or -- bis gau -- di --
  is
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
