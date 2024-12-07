\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/2 \autoBeamOff \tempoMarkup "Molto tarde"
    \set Staff.timeSignatureFraction = 2/2
  d'\breve^\partSc
  d1 cis
  d\breve
  es1. es2
  d d1 c2
  b
}

text = \lyricmode {
  Ec --
  _ _
  ce
  quo -- mo --
  do mo -- ri --
  tur
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
