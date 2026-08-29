\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \twofourtime \key d \minor \time 2/4 \tempoMarkup "Allegro moderato"
  \partial 8 a8^\part "vlc solo" d16 a a8 d16 a a8
  \appoggiatura { d16[ e] } f4. \gotoBar "22"
    \clef bass \autoBeamOff a,8^\part "Der mitleidige Vatter"
  d a f d
  \appoggiatura d cis4 r8 a'
}

text = \lyricmode {
  \skips #8
  Eß
  le -- be dan mein
  Kind, und
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
