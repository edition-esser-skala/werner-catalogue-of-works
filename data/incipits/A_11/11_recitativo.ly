\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Der verlohrene Sohn" r8 f f f b d,
    es es r \hA es es es f c
    d d r d e e g b,
    c4 r8 c c c c f
    cis cis r \hA cis e e g f
  }
}

SoliLyrics = \lyricmode {
  Ach wohl ein lie -- ber
  Vat -- ter der ſei -- ne aig -- ne
  See -- le vor mei -- ne See -- le
  ſezt, ſich ſelbſt auch dar will
  ge -- ben vor mein boß -- haff -- tes
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    b1
    b
    b2 g
    f1
    e
  }
}

BassFigures = \figuremode {
  r1
  <7! 4- 2>
  <8>2 <6!>
  r1
  <6\\>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
