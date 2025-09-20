\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  d4^\partBc b'4. a8[ cis, g']
  \clef tenor a4^\partTc f'4. e8[ gis, d']~
  d[ c16 b!] a[ b c a] b8.[\trill a32 g] f!8[ g]
}

text = \lyricmode {
  San -- _ _
  San -- _ _
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
