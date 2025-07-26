\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c4^\partBc c'2 h4
  \clef alto c^\partAc c'2 h4
  \clef soprano f^\partSc f'2 e4
  d8[ g,] g'4. fis8 d[ f]
  e[ d] e4 d r
}

text = \lyricmode {
  Cre -- _ do,
  cre -- _ do,
  cre -- _ do,
  cre -- _ _ do,
  cre -- _ do
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
