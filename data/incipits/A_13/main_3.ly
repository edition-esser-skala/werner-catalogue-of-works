\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Vivace"
  d4.^\partVi e8 f d' c b \gotoBar "11"
  \clef bass \autoBeamOff d,,4.^\part "Schöpffer" e8 f[ d'] c[ b]
  a[ g] f[ e] d4 r
}

text = \lyricmode {
  \skips #6
  Bin ich dan eur
  Gott und Herr,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
