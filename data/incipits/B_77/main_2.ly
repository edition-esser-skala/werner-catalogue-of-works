\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/2 \tempoMarkup "Passato moderato"
    \set Staff.timeSignatureFraction = 2/2
  d2.^\partOrg e4 f2 fis
  g1 d
  \clef soprano << { d''2 cis } \\ { e, a } >> \clef bass d,, g~
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
