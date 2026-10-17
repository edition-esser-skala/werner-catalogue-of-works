\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  d4.^\partBc e8 f[ g] a4
  \clef alto d4.^\partAc e8 f[ g] a4
  b8[ a] g[ b] a[ g] f[ e]
}

text = \lyricmode {
  Je -- _ su "co -"
  Je -- _ su co --
  ro -- na cel -- "si -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
