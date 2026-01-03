\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\part "Judex" g' b16 b a g c8 a a16 fis d c'
    b8 b r16 g g a h8. h16 h8 d
    f, f as g es4 r16 \hA es es g
    b8. b16 b8 c des g, b as
    f f r f as c \hA as es
  }
}

SoliLyrics = \lyricmode {
  Weill dan der Sün -- der Geil sich mehrt und ü -- ber --
  häuf -- fet, und die er -- boß -- te Weld ver --
  acht ihr See -- len -- heyll, sich auf Barm --
  her -- zig -- kheit und mei -- ne Lang -- muth
  ſteif -- fet, ſo ſoll mein Zorn "er -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'2 fis
    g f~
    f es
    g e
    f c
  }
}

BassFigures = \figuremode {
  <_->2 <7- 5>
  <_-> <4! _->
  r <6>
  <6-> <7- 5>
  <_-> <6->
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
