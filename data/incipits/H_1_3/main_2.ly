\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Moderato"
  b'1^\partSs f'2
  d a b4 f
  f es d2. d4
  c2 r r
}

text = \lyricmode {
  Con -- fi --
  te -- bor ti -- _
  bi, _ Do -- mi --
  ne,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
