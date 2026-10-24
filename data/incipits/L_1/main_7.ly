\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Tempo giusto"
  \partial 8 c'8 a16 c a c a c a c \gotoBar "12"
  \clef tenor \autoBeamOff
    r8^\part "Hollähippen-Krämer" r16 f,, a8. c16
  f8 e16[ d] c[ b] a[ g]
  f4 r8 c'
}

text = \lyricmode {
  \skips 9
  Al -- lo frisch
  auf bräf gwürf -- felt
  drauf I
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
