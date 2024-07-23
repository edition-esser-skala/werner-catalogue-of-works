\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  a'2^\partSc h g4 c
  c h8[ a] h2 a4 d
  d h e2. dis4
}

text = \lyricmode {
  Sa -- lu -- tis hu --
  ma -- nae sa -- tor, hu --
  ma -- nae "sa -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
