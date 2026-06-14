\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  a'1^\partSc f'2. e4
  d2 f e2. d4
  cis2 d1 \hA cis2
  d1 r
}

text = \lyricmode {
  Pla -- ca -- re
  Chri -- ste ser -- vu --
  lis, ser -- vu --
  lis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
