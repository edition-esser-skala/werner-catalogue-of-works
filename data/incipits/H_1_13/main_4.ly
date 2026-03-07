\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  a'4^\partSs c2
  h4 d4. d8
  c4 e4. e8
  a,4 d c~
  c h a %5
}

text = \lyricmode {
  Lau -- da --
  te pu -- e --
  ri Do -- mi --
  num: Lau -- da --
  te, "lau -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
