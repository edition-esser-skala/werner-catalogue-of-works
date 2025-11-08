\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  e2^\partSc h'4 h
  g fis e dis
  e fis g a
}

text = \lyricmode {
  O sa -- lu -- 
  ta -- ris ho -- sti -- 
  a, quae coe -- li
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
