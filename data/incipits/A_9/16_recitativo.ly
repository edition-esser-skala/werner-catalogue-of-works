\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    \partial 2 r8^\part "Judex" f b16 b d \hA b
    g8 g h16 g d f es8 es16 es g g g c
    b8 b r16 g fis g g8. d16 d4
    R1
  }
}

SoliLyrics = \lyricmode {
  Woll -- an die Zeit rueckht
  an, daß ich mich all -- gmach rä -- che, daß Ur -- theil je -- den
  ſpre -- che wie er ver -- die -- net hat.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    \partial 2 b2
    h c
    cis d4 d,
    g1
  }
}

BassFigures = \figuremode {
  r2 <6> <_->
  <7- 5> <4>4 <_+>
  r1
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
  \layout { }
}
