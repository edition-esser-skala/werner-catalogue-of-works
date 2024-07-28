\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "Allegro"
  a4^\partVi cis'8( a) d( h)
  e cis \grace h4 a2 \gotoBar "22"
  \clef soprano \autoBeamOff a4(^\partSs cis8[ a)] d[ h]
  e[ cis] \grace h4 a2
  h8[ gis fis e] d'4
  cis8[ h] a2 %25
}

text = \lyricmode {
  \repeat unfold 6 { \skip8 }
  Wann __ der
  Him -- mel
  laſ -- ſet
  fal -- len,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
