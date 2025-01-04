\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 3/4 \tempoMarkup "Andante"
    \once \override Staff.TimeSignature.style = #'single-digit
  d'8^\part "bc" d, r f' e d
  cis h?16 \hA cis a8 g f e \gotoBar "9"
  d4 \clef tenor \autoBeamOff d'^\part Eliphas a
  f16[ e] d4 f'8 e d
  cis16[ d e \hA cis] a4 d8 e
}

text = \lyricmode {
  \skips 13
  Al -- ſo
  ſeyn __ _ der Men -- ſchen
  Gmüth, __ _ offt der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
