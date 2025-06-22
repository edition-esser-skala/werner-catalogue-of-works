\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  a'4^\partSs f8[ e] d4 d' cis8[ d \hA cis d]
  e4 a, r a8[ h] cis[ d \hA cis d]
  e4 a, r a b8[ c] d4
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  _ son, e -- lei --
  _ son, e -- "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
