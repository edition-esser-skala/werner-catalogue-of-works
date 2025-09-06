\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    \once \omit Staff.TimeSignature
  d\breve*1/8^\partBc e d d \bar "||"
  \time 4/4 d4. d8 cis4 d
  \clef soprano d''4.^\partSc d8 cis4 d
  b2 a4 gis
}

text = \lyricmode {
  Re -- _ qui -- em.
  Re -- qui -- em ae --
  Re -- qui -- em ae --
  ter -- nam, "ae -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
