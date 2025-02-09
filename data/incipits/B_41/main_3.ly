\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  cis'8^\partSc d4 h8 cis cis d[ cis16 h]
  cis8 d e d16[ cis] h4 e,8 e'
  cis cis cis e a, h16 cis d8 e
}

text = \lyricmode {
  Pa -- trem o -- mni -- po -- ten --
  tem, fa -- cto -- rem coe -- li et
  ter -- rae, vi -- si -- bi -- li -- um o -- "mni -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
