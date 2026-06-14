\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 3/2
  g'2^\partBc e4 a2 g4
  f2 e \clef soprano c''^\partSc
  h4 e2 d4 c8[ h] c4
}

text = \lyricmode {
  Ti -- bi Chri -- ste
  splen -- dor, Ti --
  bi Chri -- ste splen \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
