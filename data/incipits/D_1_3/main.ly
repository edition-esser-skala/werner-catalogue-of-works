\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  b'2^\partBc b4 b
  b b,8 b' b4 b, \gotoBar "8"
  \clef soprano f'''2^\partSc f4 f
  f f,8 f' f4 f,
}

text = \lyricmode {
  E -- sto -- te
  for -- tes in bel -- lo,
  E -- sto -- te
  for -- tes in bel -- lo,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
