\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  c8.^\partTc c16 c8 c a[ f'8.] d16[ h8]
  g[ e'8.] cis16[ a8] fis[ d'8.] h16[ g8]
  e c'4 h8 c a fis[ d']
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- _
  _ _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
