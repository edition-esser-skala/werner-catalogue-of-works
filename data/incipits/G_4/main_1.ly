\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "Allegretto" \autoBeamOff
  a'8.^\partSc a16 c8 a e' e r e
  f e e[ f] e h4 e8
  cis8. cis16 d8 d h c c h
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son, Chri --
  ste e -- lei -- son, Chri -- ste
  au -- di nos, Chri -- ste ex -- au -- di
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
