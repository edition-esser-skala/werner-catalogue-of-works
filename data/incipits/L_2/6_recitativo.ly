\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4 r8 g' c r16 g e8 r16 g
    c,8 r16 e e8 a g16 g g a b8 b16 a
    f8 r16 f a8 f e r16 gis h8 e,
    c r c e g g16 g e8 c
  }
}

SoliLyrics = \lyricmode {
  Ob -- wohl ob -- ſchon ob --
  gleich und ſin -- te -- mall der ley -- dig krach düer -- re
  Tod mit ſei -- nem Pfeil in ſchel -- ler
  Eyl un -- ſern Rich -- ter den Tho -- ma
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c1
    a2 cis
    d gis,
    a e'
  }
}

BassFigures = \figuremode {
  r1
  <5>2 q
  r <6>
  r <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Barthlme"
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
