\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \major \time 1/2 \autoBeamOff \tempoMarkup "Larghetto"
  r4^\part "St: Petrus" a8 h16[ gis]
  a4 e16[ gis] h[ d]
  cis4 e8 fis16[ e]
  e8 d16[ cis] \tuplet 3/2 8 { fis[ e d] cis[ h a] }
}

text = \lyricmode {
  Troſt und
  Freud, Süeſ -- ſig --
  kheit iſt auf
  e -- wig zue -- "be -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
