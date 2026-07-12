\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
  r8^\partVi f'4 a16 b
  c8 c,4 d16 e \gotoBar "18"
  \clef tenor \autoBeamOff f,,4.^\part "Gerechtigkeit" a16[ b]
  c8 c,4 d16[ e]
  f4 f'
}

text = \lyricmode {
  \skips 7
  Ob -- ſchon
  Gott auß der
  Noth "al -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
