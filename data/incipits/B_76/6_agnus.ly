\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Adagio"
    g'1-\solo
    fis2~ fis
    g4. f8 e d c h
    a a'4 g8 fis e d cis
    h h' e, g fis4 fis,
    h h' gis2
  }
}

BassFigures = \figuremode {
  r1
  <5>2 <6>
  r <_+>8 <_!> <6> <6\\>
  r2 <_+>4 <6>8 <6\\>
  r2 <6 4>4 <5 _+>
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
