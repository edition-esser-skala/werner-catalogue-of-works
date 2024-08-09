\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key h \minor \time 3/4 \tempoMarkup "Larghetto"
  r8^\partVi fis' h( d) cis( e,)
  d fis h( d,) cis( h) \gotoBar "9"
  \clef alto \autoBeamOff h4.^\partAs d16[ cis] h8 ais
  h4 h, r8 d'
  a!4. e8 e g
}

text = \lyricmode {
  \repeat unfold 7 { \skip 8 }
  Be -- _ _ ne --
  di -- ctus, qui
  ve -- _ nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
