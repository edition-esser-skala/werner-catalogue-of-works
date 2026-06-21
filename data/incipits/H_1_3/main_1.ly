\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \tempoMarkup "Tempo giusto" \autoBeamOff
  b'4.^\partSc d8 b8. b16 a4
  r2 r8 b es4
  es8 d c4 d8 b4 b8
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus
  Do -- _
  mi -- no me -- o: Se -- de,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
