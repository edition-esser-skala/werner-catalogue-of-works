\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r4^\partSc d'4. cis8 d4~
  d cis r f~
  f e8[ d] e2
  es2. d4
}

text = \lyricmode {
  San -- _ _
  ctus, san --
  _ ctus,
  san \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
