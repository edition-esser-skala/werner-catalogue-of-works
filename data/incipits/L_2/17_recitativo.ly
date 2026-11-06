\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r16^\part "Barthlme" d d d g g d f es8 es r16 es g as
    b8. g16 es8 g c, c16 e g8 a
    f8. f16 f \clef tenor c'^\part "Schnepfendrekh" a c d8 a c8. c16
    b4 r16 es c b! g8. d16 d4
  }
}

SoliLyrics = \lyricmode {
  Öß Dal -- khen, Li -- meln und öß Nar -- ren! wanß lie -- ber
  thäts dö Zeit er -- ſpah -- ren und bald oän
  Rich -- ter wöhln. Döß iß mär wohl ä Zim -- mer --
  ſtokh von zö -- hen -- tau -- ſend Ein.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    h!2 c
    g' e!
    f fis
    g4 c, d4. c8
  }
}

BassFigures = \figuremode {
  <6>2 <_->
  <6- [_-]> <6>
  r <6>
  <_->4 q <4> <_+>
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
