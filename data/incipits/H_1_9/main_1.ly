\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  a4.^\partTs h16[ cis] d4 \clef soprano d'~^\partSs
  d8 cis16 h \hA cis[ h] \hA cis8 d d r4
  r r8 c4 b16 a g8 f
  f16[ e] e8
}

text = \lyricmode {
  Di -- xit "Do -" Se --
  de a dex -- tris me -- is,
  se -- de a dex -- tris
  me -- is,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
