\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  r4^\partSc h' e dis e h
  r h e dis e h
  r h g'4. fis8 e2
}

text = \lyricmode {
  I -- ste con -- fes -- sor,
  i -- ste con -- fes -- sor
  Do -- _ mi -- ni
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
