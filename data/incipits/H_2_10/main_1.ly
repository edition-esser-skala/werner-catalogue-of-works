\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  d4.^\partTs d8 d[ cis] cis a
  \clef soprano a'4. a8 a[ g] g d'
  e e f f f4 e\trill
  f
}

text = \lyricmode {
  De pro -- fun -- dis cla --
  De pro -- fun -- dis cla --
  ma -- vi ad te, Do -- mi --
  ne,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
