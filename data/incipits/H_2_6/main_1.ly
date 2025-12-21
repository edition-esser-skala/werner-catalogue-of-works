\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  f4^\partSs g a a
  b a a g
  a r f g
  a a a2
  a4
}

text = \lyricmode {
  Mi -- se -- re -- re
  me -- i, De -- _
  us, se -- _
  cun -- dum ma --
  gnam
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
