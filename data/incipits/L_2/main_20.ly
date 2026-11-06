\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 6/8 \tempoMarkup "Andante"
  d'4.^\partVi g
  h16 g fis e d c h c d fis, g8 \gotoBar "7"
  \clef tenor \autoBeamOff h,8[^\part "Schullmeiſter" c] d g,4 e'8
  d[ c] h a d, r
}

text = \lyricmode {
  \skips 13
  Mi braucht man zu %7
  al -- len Sa -- chen
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
