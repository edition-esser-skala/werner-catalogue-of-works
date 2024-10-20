\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  d'4.^\partSc d8 d4 d d d
  d4. d8 d4 d d d
  d d d1
}

text = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to
  cor -- de "me -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
