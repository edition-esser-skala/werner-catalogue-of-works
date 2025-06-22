\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  a2^\partTs a16[ g a8]~ a16[ h cis a]
  d8 d, r4 r8 f c'4~
  c16[ b c8]~ c16[ d e c] f8 f, r4
}

text = \lyricmode {
  Be -- a --
  _ tus, be -- a --
  _ tus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
