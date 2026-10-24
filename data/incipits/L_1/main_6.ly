\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Hollähippen-Krämer" a c16 c c e e8 a, r e'
  cis8. cis16 cis d e f d8 r16 d d8 f
}

text = \lyricmode {
  Äs iſt än al -- tes Sprich -- wort ſo
  I hab ghert bald da bald dort: was an den
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
