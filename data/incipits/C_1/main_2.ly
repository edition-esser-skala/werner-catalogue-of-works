\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  c'4.^\partSc c8 c[ h16 a] \hA h4
  c r r2
  r8 h4 d8 c[ \hA h] c[ \hA h16 a]
}

text = \lyricmode {
  Di -- es i -- _
  rae,
  di -- es il \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
