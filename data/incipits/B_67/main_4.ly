\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  r2^\partSc a'2. b4
  c2 f,2. g4
  a b c1
  c2 c h
}

text = \lyricmode {
  San -- _
  ctus, san -- _
  _ _ _
  ctus, "san -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
