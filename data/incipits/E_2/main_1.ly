\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 4/4 \tempoMarkup "Largo"
  e'4.^\partVi a8 gis8. gis16 a8 h
  cis8. d32 cis h8 a \appoggiatura a gis4 a8 cis, \gotoBar "7"
  \clef tenor \autoBeamOff e,4^\partTs e8 a, gis8. gis16 a8 \tuplet 3/2 8 { h16[ cis d] }
  cis8 h
}

text = \lyricmode {
  \skips 14
  Ô Mut -- ter, Mut -- ter mei -- nes
  Her -- ren,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
