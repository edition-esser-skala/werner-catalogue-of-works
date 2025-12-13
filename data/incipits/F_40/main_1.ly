\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  r4^\partTs h c cis dis e
  e dis e \clef soprano h'^\partSc c cis
  dis e e dis e2
}

text = \lyricmode {
  Tri -- stes e -- rant A --
  po -- sto -- li, Tri -- stes e --
  rant A -- po -- sto -- li,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
