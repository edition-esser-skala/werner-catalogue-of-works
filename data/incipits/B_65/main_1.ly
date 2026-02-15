\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 4/4 \tempoMarkup "Presto" \autoBeamOff
  a'8.^\partSc a16 b4 r8 a g[ c]~
  c[ b] a d d[ cis] d4
  a8 d4 c8 d4 cis8[ d]
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- _
  son, Ky -- ri -- e "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
