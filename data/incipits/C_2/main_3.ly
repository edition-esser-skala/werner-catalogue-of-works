\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio[se]"
  r4^\partSc a' f f
  b2. a8 g
  f2 e
}

text = \lyricmode {
  Me -- men -- to
  me -- i, me --
  men -- to,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
