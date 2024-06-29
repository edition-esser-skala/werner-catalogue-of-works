\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  b'1^\partSc a2 f
  g c b2. b4
  a2 d g, c
}

text = \lyricmode {
  Je -- su Dul --
  cis me -- mo -- ri --
  a, dans ve -- ra
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
