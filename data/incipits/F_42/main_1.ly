\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 3/2
  r4^\partSc a' b2 a4 d
  d c b4. b8 a4 d~
  d cis d a b8[ c] d[ e]
}

text = \lyricmode {
  Sa -- lu -- tis hu --
  ma -- nae sa -- _ tor, sa --
  _ tor, Je -- su "vo -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
