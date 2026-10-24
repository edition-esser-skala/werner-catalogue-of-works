\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Hollähippen-Krämer" f, a16 a a h cis8. cis16 cis8 cis16 d
  e8. cis16 a8 g f4 r8 a
}

text = \lyricmode {
  Wäll I mei Krä -- mel ganz ver -- ſpilt, ſo iß
  Hol -- lä -- hip -- pen Brauch wälß
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
