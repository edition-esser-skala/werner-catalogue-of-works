\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'4.^\partSc d8 d d d d
  d8. d16 dis8 e \hA dis dis e4~
  e8 d d[ cis] d4 a8 h
}

text = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to cor --
  de me -- o, in "con -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
