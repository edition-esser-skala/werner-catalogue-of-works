\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  g'16[^\partSs a] h[ c] d8 c16 d h8 c16 d e4
  d r r2
  r8 d4 cis16 cis d8 a h4
  a
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o:
  Vir -- gam vir -- tu -- tis tu --
  ae
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
