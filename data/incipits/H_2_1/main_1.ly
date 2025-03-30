\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
  a4^\partTs d8[ e] f4
  e4. f8 d4
  d8[ cis] cis4 d
  b2 b4
}

text = \lyricmode {
  Me -- men -- to,
  Do -- mi -- ne,
  Da -- vid et
  o -- mnis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
