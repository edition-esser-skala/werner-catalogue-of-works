\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  r4^\partSc d'4. c8[ b a]
  g[ f e d] cis a'4 g8
  f4 d r8 e[ f] d
}

text = \lyricmode {
  San -- _
  _ ctus, san -- _
  _ ctus, san -- ctus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
