\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    r16 g''\p es16. c32 g8 es r16 as' f16. d!32 h8 f
    \sbOn r32 es g c es g, c \hA es \sbOff g8 es, r16 des'32 des des16 des des des des des
    \sbOn c32 f, as c f \hA as, c f \sbOff as16. f,32 f8 r16 es' c16. a32 fis16. c'32 a16. \hA fis32
    \sbOn g g h! g d' h g' d \sbOff h'16. g,32 g8 r16 b' g16. es32 b16. g32 g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    r16 es'\p c16. g32 es8 c r16 f' d16. h!32 f8 d
    \sbOn r32 c es g c \hA es, g c \sbOff es8 c, r16 e32 e e16 e e e e e
    \sbOn f32 c f as c f, \hA as c \sbOff f16. \hA as,32 as8 r16 c a16. fis32 c16. a'32 \hA fis16. c32
    \sbOn h! d g d h' g d' h \sbOff g'16. h,32 h8 r16 g' es16. b32 g16. es32 es8
  }
}

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Judex" es8 g h! h r d16 f,
    es8 es r c'16 g e8 r16 g b8 as
    f f r as16 c fis,8 fis a c,
    d4 r r r8 es16 g
  }
}

SoliLyrics = \lyricmode {
  Hört ihr Him -- mel was ich
  ſa -- ge, und die Erd ver -- nehm die
  Kla -- ge, ſo ich jezt er -- khlä -- ren
  will: Ich bin
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    c4 r c r
    c r b r
    as r a r
    g r es' r
  }
}

BassFigures = \figuremode {
  <_->2 <7! 4 2>
  <_-> <6 4! 2->
  <6> <6\\ 5->
  <_!> <5>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
