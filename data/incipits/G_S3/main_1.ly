\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4  \tempoMarkup "[no tempo]"
  d8^\partVi d'16 cis <e, a,>8 g16 e fis d d' cis <e, a,>8 g16 e \gotoBar "3"
  \clef soprano \autoBeamOff d'8^\partSc d d cis d d16 d d8[ cis]
  d d16[ cis] h8 cis d d16 d d8[ cis]
  d
}

text = \lyricmode {
  \skips 13
  Ky -- ri -- e e -- lei -- son, e -- lei --
  son, Chri -- ste e -- lei -- son, e -- lei --
  son
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
