\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 12/8 \tempoMarkup "Allegro"
  d16^\partVi e f g a b a8 e' a, d b' d, cis4 \gotoBar "7"
    \clef tenor \autoBeamOff a,8^\part "Judas"
  d a d a f a f d r r4 r8
}

text = \lyricmode {
  \skips 13
  Nun
  muß ich ver -- zweif -- fln, ver -- zweif -- fln,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
