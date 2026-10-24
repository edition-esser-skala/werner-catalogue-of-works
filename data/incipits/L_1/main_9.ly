\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Spirituoso"
  a'8.^\partVi f32 e d8 d d'8. f,32 e d8 \gotoBar "5"
    \clef bass \autoBeamOff d,^\part "Arzt"
  a' a a16[ g] a[ e] f8 d r d'
  c!16[ g] e[ c] b'8. b16 a4 r8 a
}

text = \lyricmode {
  \skips 9
  Hier
  hab ich ei -- ne Pil -- len die
  wegt biß ze -- hen Pfund, wer
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
