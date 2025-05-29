\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 5/4 \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/8^\partBc d a' b a \bar "||"
  \clef alto \time 3/2 \tempoMarkup "[no tempo]"
    f'2^\partAc g4 b2*1/2 \clef soprano c2^\partSc
    d4 f2 e4 f8[ g f e]
}

text = \lyricmode {
  Ro -- _ ra -- _ te
  Coe -- li, coe -- Coe --
  li, coe -- li "de -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
