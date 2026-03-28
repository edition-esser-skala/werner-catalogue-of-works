\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "[no tempo]"
  r16^\partVi d'' b16. f32 d16. f32 d16. b32 g4
    \clef tenor \autoBeamOff d^\part "Sisera"
  r8 g, es' c \sbOn b32[ a \hA b c d c d es] \tuplet 3/2 8 { f16[ \hA es d] c[ b as] } \sbOff
  g4
}

text = \lyricmode {
  \skips 8
  Wie!
  wie ſoll der Scla -- _ vens --
  geiſt
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
