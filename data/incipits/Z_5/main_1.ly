\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
  a'4^\partSc a a
  a2 a4
  fis' fis e~
  e8 fis e8.[ d16] d4\trill
  cis2 r4
}

text = \lyricmode {
  O sa -- lu --
  ta -- ris,
  sa -- lu -- ta --
  ris ho -- sti --
  a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
