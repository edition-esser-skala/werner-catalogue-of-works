\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  a'4^\partSs h c8 d16 e f4~
  f16[ e] d c \appoggiatura c8 h4 a \clef alto f4~^\partAs
  f16[ d] e[ c] d4\trill c r
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus Do --
  mi -- no me -- o: dex --
  tris me -- is,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
