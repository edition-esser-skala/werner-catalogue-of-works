\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 4/4 \tempoMarkup "Andante"
  e'4^\partVi e a,16 gis a4.
  h16 cis d e fis d cis h cis a e' cis \grace gis'8 a4 \gotoBar "11"
  \clef soprano \autoBeamOff
    e4^\partSs e a,16[ gis] a4.
  h16[ cis d e] fis[ d] cis[ h] \tuplet 3/2 8 { cis[ h a] } a4.
}

text = \lyricmode {
  \skips 18
  Da -- te ro -- sas,
  da -- _ te flo -- res,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
