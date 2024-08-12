\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Andante"
  r4^\partVi r8 a'16 b c8 a d c16 b
  c8 f, r f'16 es d es d c b c d b \gotoBar "9"
  b8 a16 b g8. f16 f f' c b
    \clef soprano \autoBeamOff r8^\partSc a16[ b16]
  c8 b16[ a] d8 c16 b c8 f, f'8. es16
}

text = \lyricmode {
  \skips 28
  E --
  sto -- te for -- tes in bel -- lo, et "pu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
