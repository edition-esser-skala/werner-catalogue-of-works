\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 6/8 \tempoMarkup "Larghetto"
  g''2.~^\part "ob solo"
  g8. g,16 a8 h g r \gotoBar "10"
  \clef alto \autoBeamOff d4^\part "Der verlohrene Sohn" \appoggiatura { c16[ d] } e8 d4 \appoggiatura { c16[ d] } e8 %10
    d8[ g,] a h g r
}

text = \lyricmode {
  \skips #5
  Dan gleich wie die
  Waſ -- ſer -- wel -- len
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
