\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 3/4 \tempoMarkup "Ariose" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    e2^\solo a4
    gis2 a4
    d e cis
    h2 cis4
    d cis8[ h] cis4
    h fis8[ gis] a4
    gis h a
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri --
  e e --
  lei -- _ son,
  Ky -- ri --
  e __ _ e --
  lei -- son, e --
  lei -- _ son,
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    a'4-\solo gis fis
    e d cis
    h8 a gis4 a
    e'8 fis gis4 a
    fis gis a
    d,2 dis4
    e d cis
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  <6>4 q2
  q2 <5>4
  r2 <6>4
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
