\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Andante"
  c'2^\partVi d4. e16 f
  c4 f, r8 b' b b \gotoBar "9"
  \clef alto \autoBeamOff c,,2 d4. e16[ f]
  c4 r8 f g16[( a] b4) b8
  a4
}

text = \lyricmode {
  \skips 9
  Ô Menſch be --
  tracht! und nicht ver --
  acht,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
