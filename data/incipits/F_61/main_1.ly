\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  a'2^\partSc b a4 d
  d c b2 a
  r r4 a b8[ c] d[ e]
}

text = \lyricmode {
  Sa -- lu -- tis hu --
  ma -- nae sa -- tor,
  Je -- su, "vo -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
