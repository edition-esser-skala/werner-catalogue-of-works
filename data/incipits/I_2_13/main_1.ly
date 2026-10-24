\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  d4~^\partTs d16[ b c d] g,[ fis] g8 r d'
  g g,16[ a b8] a16[ g] g8 fis r4
  es'4. d16[ cis] d4 r
}

text = \lyricmode {
  A -- _ ve Re --
  gi -- na __ coe -- lo -- rum,
  a -- _ ve
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
