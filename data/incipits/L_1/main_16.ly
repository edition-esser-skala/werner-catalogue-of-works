\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Andante"
  r8^\partVi d' d, d' c16 d c b a g f es
  d8 \gotoBar "5" \clef bass \autoBeamOff
    b^\part "Arzt" b, b' a16[ b] a[ g] f[ es] d[ c]
  b4 r8 f' g a16[ b] c[ g] e[ c]
}

text = \lyricmode {
  \skips 12
  Ist et -- wann ein be -- tag -- te
  Frau mit neun -- zig Jahr "zu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
