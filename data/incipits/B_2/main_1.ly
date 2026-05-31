\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \minor \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  a4.^\partTc e'8 d c h4
  a c4. h16[ a] g8[ fis]
  e e'4 d c16[ h] c4
}

text = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- _ lei --
  son, e -- _ _ "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
