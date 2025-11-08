\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key b \major \time 4/4 \tempoMarkup "[no tempo]"
  \partial 8 f,,8^\part "bc" b b b d16 c b8 f f b
  d d d f16 es d8[ b] \gotoBar "4" \clef soprano \autoBeamOff f'''4^\partSs
  b,8 b b b b4 f'
  b,8 b b b b4 r
}

text = \lyricmode {
  \skips 17
  O
  se -- na ra -- ri -- té, o
  se -- na spi -- la -- werck
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
