\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  f4^\partSs f8 b a c b[ es]
  d c16[ d] es8 d g[ es] c b
  a16[ b c a] f4 f8 f f b16 b
}

text = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
