\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Vivace"
  \partial 8 g'8^\partVi c8 g16 c e8 c16 e g8 e c a'
  g e c g' f16 g e g f[ g] \gotoBar "10" \clef alto \autoBeamOff g,,8^\partAs
  c g e' c g'16[ f g8] a16[ g a8]
  g4
}

text = \lyricmode {
  \skips 21
  Wäll
  heut dä Tag ſo freu -- den --
  reich
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
