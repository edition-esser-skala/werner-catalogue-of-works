\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  r2^\partSc h'8 d c h16[ a]
  h8. h16 h4 cis8 d16 d d8[ \hA cis]
  d4 r d8 d d cis
}

text = \lyricmode {
  Di -- xit, di -- xit
  Do -- mi -- nus Do -- mi -- no me --
  o, di -- xit, di -- xit
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
