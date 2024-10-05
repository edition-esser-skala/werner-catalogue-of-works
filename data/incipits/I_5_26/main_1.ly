\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  r4^\partSc c' a8[ g] a[ g16 f]
  g4. g8 f[ g] a[ h]
  c4 r r2
}

text = \lyricmode {
  Sub tu -- _
  um prae -- si -- di --
  um
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
