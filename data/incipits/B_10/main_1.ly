\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
  d'8.^\partSc d16 d8 fis d[ h]
  cis16[ h cis d] cis8[ e cis a]
  h4. g16[ a] h8[ cis]
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  _ _
  son, e -- "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
