\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 12/8 \tempoMarkup "[no tempo]"
  g16^\partVi a h a g8 d'16 e fis e d8 \gotoBar "7"
    \clef bass \autoBeamOff g,8 h16[ a g8] d'4 d,8
    g4 g,8 g4 r8 a' c16[ h a8] fis a16[ g fis8]
}

text = \lyricmode {
  \skips 10
  I mit mein Ver --
  ſtands Maß -- Stab möſ -- ſe __ al -- le __
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
