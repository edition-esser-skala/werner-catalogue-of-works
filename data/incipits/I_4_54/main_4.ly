\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key es \lydian \time 3/4 \tempoMarkup "Adagio e staccato"
  r8^\partVi es' es es es es
  r c c c c c \gotoBar "22"
  \clef soprano \autoBeamOff r4^\partSs es, es
  es r r
  es r r
  e r r
  e r r
}

text = \lyricmode {
  \repeat unfold 10 { \skip 4 }
  Ad te
  su --
  spi --
  ra --
  mus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
