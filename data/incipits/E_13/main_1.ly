\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \major \time 6/8 \tempoMarkup "Largo"
  a'8.^\partOrg e16 cis8 a4 \clef treble e''8^\partVi
  a8. h16 a8 a4 e'8
  a,4. r4 \gotoBar "18" \clef soprano \autoBeamOff e8^\partSs
  a8.[ h16] a8 a4 e'8
  a,4. r4 a8
}

text = \lyricmode {
  \skips 11
  Er --
  bar -- met euch ihr
  Freundt, auch
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
