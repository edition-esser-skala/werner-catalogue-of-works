\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  g'4.^\partBc a8 fis[ d] g4~
  g8[ fis] fis[ e16 d] e2
  \clef soprano d''4.^\partSc e8 cis[ a] d4
}

text = \lyricmode {
  San -- _ _ _
  _ \hy
  San -- _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
